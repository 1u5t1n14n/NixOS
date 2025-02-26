{ userName, config, ... }:

{

	services.syncthing = {
		enable = true;
		user = "${userName}";
		dataDir = "/home/${userName}";
		configDir = "${config.services.syncthing.dataDir}/.config/syncthing";
		settings = {
			options.urAccepted = -1;
			gui = {
				user = "${userName}";
				password = "goodPassword";
			};
		};
	};

	networking.firewall = {
		allowedTCPPorts = [ 8384 22000 ];
		allowedUDPPorts = [ 22000 21027 ];
	};

}
