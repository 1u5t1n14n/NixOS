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
			PAPERLESS_ADMIN_USER = "admin";
			PAPERLESS_OCR_LANGUAGE = "deu";
			PAPERLESS_OCR_USER_ARGS = {
				optimize = 1;
				pdfa_image_compression = "lossless";
			};
		};
		consumptionDirIsPublic = true;
	};

	environment.etc."paperless/pass".text = "${builtins.getEnv "PAPERLESS"}";

	networking.firewall.allowedTCPPorts = [ paperless.port ];

}
