{ config, ... }:

let
	paperless = config.services.paperless;

in {

	services.paperless = {
		enable = true;
		address = "0.0.0.0";
		port = 28981;
		settings = {
			PAPERLESS_ADMIN_USER = "root";
			PAPERLESS_ADMIN_PASSWORD = "${builtins.getEnv "PAPERLESS"}";
			PAPERLESS_OCR_LANGUAGE = "deu";
			PAPERLESS_OCR_USER_ARGS = {
				optimize = 1;
				pdfa_image_compression = "lossless";
			};
		};
		consumptionDirIsPublic = true;
	};

	networking.firewall.allowedTCPPorts = [ paperless.port ];

}
