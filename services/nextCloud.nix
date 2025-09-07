{ config, inputs, host, pkgs, ... }:

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
				inherit calendar contacts mail cookbook maps;
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
				secretFile = "/etc/minioPassNextCloud";
				hostname = "localhost";
				useSsl = false;
				port = 9000;
				usePathStyle = true;
				region = "us-east-1";
			};
		};

		minio = {
			enable = true;
			listenAddress = "127.0.0.1:9000";
			consoleAddress = "127.0.0.1:9001";
			rootCredentialsFile = "/etc/minioPass";
		};
	};

	systemd.services.minioSetup = {
		path = [ pkgs.minio-client pkgs.getent ];
		script = ''
			mc alias set minio http://localhost:9000 ${accessKey} ${secretKey} --api s3v4
			mc mb --ignore-existing minio/nextcloud
		'';
		after = [ "minio.service" ];
		wantedBy = [ "nextcloud-setup.service" ];
	};

	environment = {
		# Is it working without this?
		# systemPackages = [ pkgs.minio-client ];
		etc = {
			minioPass.text = ''
				MINIO_ROOT_USER=${cfg.config.dbuser}
				MINIO_ROOT_PASSWORD=${secretKey}
			'';
			minioPassNextCloud.text = secretKey;
		};
	};

	networking.firewall.allowedTCPPorts = [ 80 443 ];

}
