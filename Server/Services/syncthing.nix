{ userName, ... }:

{

	services.syncthing = {
		enable = true;
		guiAddress = "0.0.0.0:8384";
		settings.gui = {
			user = "${userName}";
			password = "goodPassword";
		};
	};

	networking.firewall = {
		allowedTCPPorts = [ 8384 22000 ];
		allowedUDPPorts = [ 22000 21027 ];
	};

}
