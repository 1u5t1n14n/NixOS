{ ... }:

{

	environment.etc."paperless/password".text = "goodPassword";

	services.paperless = {
		enable = true;
		address = "0.0.0.0";
		port = 28981;
		passwordFile = "/etc/paperless/password";
		settings = {
			PAPERLESS_ADMIN_USER = "admin";
		};
	};

	networking.firewall.allowedTCPPorts = [ 28981 ];

}
