{ config, host, pkgs, lib, ... }:

let
	cfg = config.services.nextcloud;
	occ = "${cfg.occ}/bin/nextcloud-occ";

	accessKey = "nextcloud";
	secretKey = "diesisteinsecretkey";

in
{

	imports = [ ../modules/pkgs/nextCloud.nix ];

	sops.secrets = {
		"services/nextcloud/main".owner = cfg.config.dbuser;
		"services/nextcloud/jonathan".owner = cfg.config.dbuser;
	};

	services = {
		nextcloud = {
			enable = true;
			hostName = "localhost";

			package = pkgs.nextcloud32;

			# Set Theming URL
			extraOCC = ''
				${occ} theming:config url "${
					if cfg.https then
						"https"
					else "http"}://${
					if (cfg.hostName != "localhost") then
						cfg.hostName
					else host.name}"
			'';

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
		minioSetup = lib.mkIf (config.services.minio.enable && cfg.enable) {
			path = [ pkgs.minio-client pkgs.getent ];
			script = ''
				${lib.getExe pkgs.minio-client} alias set minio http://${cfg.config.objectstore.s3.hostname}:${toString cfg.config.objectstore.s3.port} ${accessKey} ${secretKey} --api s3v4
				${lib.getExe pkgs.minio-client} mb --ignore-existing minio/${cfg.config.objectstore.s3.bucket}
			'';
			serviceConfig = {
				User = cfg.config.dbuser;
				Group = config.users.users.${cfg.config.dbuser}.group;
				WorkingDirectory = cfg.home;

				Type = "oneshot";
				RemainAfterExit = true;

				ProtectHome = true;
				PrivateDevices = true;
				ProtectClock = true;
			};
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
