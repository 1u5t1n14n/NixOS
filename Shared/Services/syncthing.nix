{ userName, config, ... }:

{

	services.syncthing = {
		enable = true;
		user = "${userName}";
		dataDir = "/home/${userName}";
		configDir = "${config.services.syncthing.dataDir}/.config/syncthing";
		settings.gui = {
			user = "${userName}";
			password = "goodPassword";
		};
		settings.devices."Prometheus" = {
			id = "SSILW5K-54C77OJ-JC2R6I2-GT4U5ZO-PBWQ4ZB-F7YSMK2-R4ZJZEK-5HXSDAX";
			autoAcceptFolders = true;
		};
	};

	networking.firewall = {
		allowedTCPPorts = [ 8384 22000 ];
		allowedUDPPorts = [ 22000 21027 ];
	};

}
