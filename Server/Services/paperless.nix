{ config, ... }:

let
	paperless = config.services.paperless;

in {

	services.paperless = {
		enable = true;
		address = "0.0.0.0";
		port = 28981;
		passwordFile = "/etc/paperless/pass";
		settings = {
			PAPERLESS_APP_TITLE = "Archiv";
			PAPERLESS_ADMIN_USER = "root";
			PAPERLESS_OCR_LANGUAGE = "deu";
			PAPERLESS_OCR_USER_ARGS = {
				optimize = 1;
				pdfa_image_compression = "lossless";
			};
			PAPERLESS_EMPTY_TRASH_DELAY = 15;
			PAPERLESS_CONSUMER_RECURSIVE = true;
			PAPERLESS_CONSUMER_SUBDIRS_AS_TAGS = true;
			# Needed for Office Document Support
			PAPERLESS_TIKA_ENABLED = true;
			PAPERLESS_TIKA_ENDPOINT = "http://localhost:${toString config.services.tika.port}";
			PAPERLESS_TIKA_GOTENBERG_ENDPOINT = "http://localhost:${toString config.services.gotenberg.port}";
		};
		consumptionDirIsPublic = true;
	};

	environment.etc."paperless/pass".text = "${builtins.getEnv "PAPERLESS"}";

	networking.firewall.allowedTCPPorts = [ paperless.port ];

	services = {
		tika = {
			enable = true;
			port = 9998;
		};
		gotenberg = {
			enable = true;
			port = 3000;
		};
	};

}
