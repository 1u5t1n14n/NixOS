{ config, host, pkgs, lib, ... }:

let
	cfg = config.services.nextcloud;

	accessKey = "nextcloud";
	secretKey = "diesisteinsecretkey";

in
{

	sops.secrets."services/nextcloud".owner = cfg.config.dbuser;

	services = {
		nextcloud = {
			enable = true;
			hostName = "localhost";

			package = pkgs.nextcloud31;

			configureRedis = true;
			phpOptions."opcache.interned_strings_buffer" = 16;

			# App Installation
			extraAppsEnable = true;
			autoUpdateApps.enable = cfg.extraAppsEnable;
			extraApps = with cfg.package.packages.apps; {
				inherit calendar contacts cookbook maps;
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
				adminpassFile = config.sops.secrets."services/nextcloud".path;
			};

			maxUploadSize = "1G";

			settings = {
				maintenance_window_start = 1;
				updatechecker = false;

				preview_libreoffice_path = "${pkgs.libreoffice-fresh}/bin/libreoffice";
				preview_ffmpeg_path = "${pkgs.ffmpeg-full}/bin/ffmpeg";

				# Should be 1 when Changing happens
				filesystem_check_changes = 0;

				defaultapp = "files";
				"simpleSignUpLink.shown" = false;
				login_form_autocomplete = false;

				default_phone_region = "DE";
				default_language = "de_DE";
				default_locale = "de";
				default_timezone = "Europe/Berlin";

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
			enable = true;
			listenAddress = "127.0.0.1:${toString cfg.config.objectstore.s3.port}";
			consoleAddress = "127.0.0.1:9001";
			rootCredentialsFile = "/etc/${config.environment.etc.minio.target}";

			# Only listens on localhost.
			browser = false;
		};
	};

	systemd.services.minioSetup = lib.mkIf (cfg.config.objectstore.s3.enable && config.services.minio.enable) {
		path = [ pkgs.minio-client pkgs.getent ];
		script = ''
			mc alias set minio http://${cfg.config.objectstore.s3.hostname}:${toString cfg.config.objectstore.s3.port} ${accessKey} ${secretKey} --api s3v4
			mc mb --ignore-existing minio/${cfg.config.objectstore.s3.bucket}
		'';
		serviceConfig = {
			User = cfg.config.dbuser;
			Group = config.users.users.${config.systemd.services.minioSetup.serviceConfig.User}.group;
			WorkingDirectory = cfg.home;

			# Tryin'
			ProtectHome = true;
			PrivateDevices = true;
			ProtectClock = true;
		};
		after = [ "minio.service" ];
		wantedBy = [ "nextcloud-setup.service" ];
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
