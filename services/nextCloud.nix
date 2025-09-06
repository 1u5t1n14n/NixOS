{ config, inputs, host, pkgs, ... }:

let
	cfg = config.services.nextcloud;

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
				autocreate = true;
				key = cfg.config.objectstore.s3.bucket;
				secretFile = config.sops.secrets."services/minio".path;
				hostname = "localhost";
				useSsl = false;
				port = 9000;
				usePathStyle = true;
				region = "eu-central-1";
			};
		};

		minio = {
			enable = true;
			listenAddress = "127.0.0.1:9000";
			consoleAddress = "127.0.0.1:9001";
			rootCredentialsFile = sops.templates."services/minio".path;
		};
	};

	environment = {
		systemPackages = [ pkgs.minio-client ];

		# Exec when creating Bucket!
		etc."minioCreateBucket.sh".text = ''
			#!/bin/sh
			mc config add minio http://localhost:9000 ${cfg.config.objectstore.s3.bucket} $(cat ${sops.templates.minioForUser.path}) --api s3v4
			mc mb --ignore minio/${cfg.config.objectstore.s3}
		'';
	};

	sops.secrets."services/minio".owner = cfg.config.dbuser;

	sops.templates.minioForUser = {
		owner = host.user;
		content = ''
			${config.sops.placeholder."services/minio"}
		'';
	};
	sops.templates.minio = {
		owner = "minio";
		content = ''
			MINIO_ROOT_USER=${cfg.config.objectstore.s3.bucket}
			MINIO_ROOT_PASSWORD=${config.sops.placeholder."services/minio"}
		'';
	};

}
