{ config, pkgs, lib, ... }:

let
	cfg = config.services.paperless;

in
{

	sops.secrets."services/paperless".owner = cfg.user;

	services = {
		paperless = {
			address = "127.0.0.1";
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
				PAPERLESS_TIKA_ENABLED = true;
				PAPERLESS_TIKA_ENDPOINT = "http://${config.services.tika.listenAddress}:${toString config.services.tika.port}";
				PAPERLESS_TIKA_GOTENBERG_ENDPOINT = "http://${config.services.gotenberg.bindIP}:${toString config.services.gotenberg.port}";
			};
		};

		tika = {
			enable = cfg.settings.PAPERLESS_TIKA_ENABLED;
			port = 9998;
		};
		gotenberg = {
			enable = cfg.settings.PAPERLESS_TIKA_ENABLED;
			port = 3001;

			chromium.package = pkgs.ungoogled-chromium;
			extraFontPackages = config.fonts.packages;
		};
	};

	networking.firewall.allowedTCPPorts = lib.mkIf (cfg.enable && (cfg.address == "0.0.0.0")) [ cfg.port ];

}
