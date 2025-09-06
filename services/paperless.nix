{ config, pkgs, ... }:

let
	cfg = config.services.paperless;

in
{

	sops.secrets."services/paperless".owner = cfg.user;

	services = {
		paperless = {
			enable = true;
			address = "0.0.0.0";
			port = 28981;

			consumptionDir = "${cfg.dataDir}/${cfg.settings.PAPERLESS_APP_TITLE}";
			consumptionDirIsPublic = true;
			passwordFile = config.sops.secrets."services/paperless".path;

			settings = {
				PAPERLESS_APP_TITLE = "Archives";
				PAPERLESS_ADMIN_USER = config.services.nextcloud.config.adminuser;
				PAPERLESS_OCR_LANGUAGE = "deu+eng";
				PAPERLESS_OCR_USER_ARGS = {
					optimize = 1;
					pdfa_image_compression = "lossless";
				};
				PAPERLESS_EMPTY_TRASH_DELAY = 15;
				PAPERLESS_TIKA_ENABLED = config.services.tika.enable;
				PAPERLESS_TIKA_ENDPOINT = "http://${config.services.tika.listenAddress}:${toString config.services.tika.port}";
				PAPERLESS_TIKA_GOTENBERG_ENDPOINT = "http://${config.services.gotenberg.bindIP}:${toString config.services.gotenberg.port}";
			};
		};

		tika = {
			enable = true;
			port = 9998;
		};
		gotenberg = {
			enable = true;
			port = 3001;

			# Hoping this is working
			chromium.package = pkgs.ungoogled-chromium;
			extraFontPackages = [ pkgs.corefonts ];
		};
	};

	networking.firewall.allowedTCPPorts = [ cfg.port ];

}
