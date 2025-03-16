{ userName, config, ... }:

let
	paperless = config.services.paperless;
	pass = builtins.getEnv "PAPERLESS";

in {

	services.paperless = {
		enable = true;
		address = "0.0.0.0";
		port = 28981;
		passwordFile = "/etc/paperless/password";
		settings = {
			PAPERLESS_ADMIN_USER = "${userName}";
			PAPERLESS_OCR_USER_ARGS = {
				optimize = 1;
				pdfa_image_compression = "lossless";
			};
		};
		# TODO -> find out what this means
		consumptionDirIsPublic = true;
	};

	environment.etc."paperless/password".text = "${pass}";

	networking.firewall.allowedTCPPorts = [ paperless.port ];

}
