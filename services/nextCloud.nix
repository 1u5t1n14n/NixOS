{ config, host, pkgs, lib, ... }:

let
	cfg = config.services.nextcloud;

	accessKey = "nextcloud";
	secretKey = "diesisteinsecretkey";

in
{

	sops.secrets = {
		"services/nextcloud/main".owner = cfg.config.dbuser;
		"services/nextcloud/jonathan".owner = cfg.config.dbuser;
	};

	services = {
		nextcloud = {
			enable = true;
			hostName = "localhost";

			package = pkgs.nextcloud31;

			configureRedis = true;
			phpOptions."opcache.interned_strings_buffer" = 16;

			# App Installation
			appstoreEnable = false;
			extraAppsEnable = true;
			autoUpdateApps.enable = cfg.extraAppsEnable;
			extraApps = with cfg.package.packages.apps; {
				inherit calendar contacts maps news;
			};

			nginx = {
				hstsMaxAge = 15552000;
				recommendedHttpHeaders = true;
			};

			database.createLocally = true;
			config = {
				dbtype = "pgsql";
				dbuser = "nextcloud";
				adminuser = "root";
				adminpassFile = config.sops.secrets."services/nextcloud/main".path;
			};

			maxUploadSize = "1G";

			settings = {
				maintenance_window_start = 1;
				updatechecker = false;

				preview_libreoffice_path = "${pkgs.libreoffice-fresh}/bin/libreoffice";
				preview_ffmpeg_path = "${pkgs.ffmpeg-full}/bin/ffmpeg";

				# Should be 1 when Changing happens
				filesystem_check_changes = 0;
				quota_include_external_storage = true;

				defaultapp = "files";
				"simpleSignUpLink.shown" = false;
				login_form_autocomplete = false;

				default_phone_region = "DE";
				default_language = "de_DE";
				default_locale = "de";
				default_timezone = config.time.timeZone;

				reduce_to_languages = [ "de" "de_DE" "en" ];

				trusted_domains = [
					cfg.hostName
					"192.168.178.178"
					host.name
				];
			};

			config.objectstore.s3 = {
				enable = true;
				bucket = "nextcloud";
				verify_bucket_exists = true;
				key = accessKey;
				secretFile = "/etc/${config.environment.etc.nextcloud.target}";
				hostname = cfg.hostName;
				useSsl = false;
				port = 9000;
				usePathStyle = true;
				region = "us-east-1";
			};
		};

		minio = {
			enable = cfg.config.objectstore.s3.enable;
			listenAddress = "127.0.0.1:${toString cfg.config.objectstore.s3.port}";
			consoleAddress = "127.0.0.1:9001";
			rootCredentialsFile = "/etc/${config.environment.etc.minio.target}";

			# Only listens on localhost.
			browser = false;
		};
	};

	systemd.services = {
		nextcloudEnvironmentSetup = {
			path = [ cfg.occ ];
			script = ''
				${lib.getExe cfg.occ} app:enable encryption
				${lib.getExe cfg.occ} encryption:enable

				${lib.getExe cfg.occ} app:enable files_external

				${lib.getExe cfg.occ} theming:config disable-user-theming yes
				${lib.getExe cfg.occ} theming:config name "${host.name}"
				${lib.getExe cfg.occ} theming:config color "#7d1fa3"
				${lib.getExe cfg.occ} theming:config background backgroundColor

			'' + lib.optionalString config.services.paperless.enable ''

				${lib.getExe cfg.occ} files_external:create /${config.services.paperless.settings.PAPERLESS_APP_TITLE} local null::null -c datadir=${config.services.paperless.consumptionDir}

			'';
			serviceConfig = {
				User = cfg.config.dbuser;
				Group = config.users.users.${cfg.config.dbuser}.group;
				WorkingDirectory = cfg.home;
				ProtectHome = true;
				PrivateDevices = true;
				ProtectClock = true;
			};
			after = [ "nextcloud-setup.service" ];
			wantedBy = [ "multi-user.target" ];
		};

		minioSetup = lib.mkIf (config.services.minio.enable && cfg.enable) {
			path = [ pkgs.minio-client pkgs.getent ];
			script = ''
				${lib.getExe pkgs.minio-client} alias set minio http://${cfg.config.objectstore.s3.hostname}:${toString cfg.config.objectstore.s3.port} ${accessKey} ${secretKey} --api s3v4
				${lib.getExe pkgs.minio-client} mb --ignore-existing minio/${cfg.config.objectstore.s3.bucket}
			'';
			serviceConfig = config.systemd.services.nextcloudEnvironmentSetup.serviceConfig;
			after = [ "minio.service" ];
			wantedBy = [ "nextcloud-setup.service" ];
		};
	};

	environment = {
		etc = {
			minio.text = ''
				MINIO_ROOT_USER=${cfg.config.dbuser}
				MINIO_ROOT_PASSWORD=${secretKey}
			'';
			nextcloud.text = secretKey;
		};
	};

	networking.firewall.allowedTCPPorts = lib.mkIf cfg.enable [ 80 443 ];

}
