{ ... }:

{

	# not production ready!
	environment.etc."nextcloud-admin-pass".text = "goodPassword";
	services.nextcloud = {
		enable = true;
		hostName = "localhost";
		config.adminpassFile = "/etc/nextcloud-admin-pass";
	};

}
