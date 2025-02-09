{ config, ... }:

{

	services.immich = {
		enable = true;
		port = 2283;
		mediaLocation = "${config.services.syncthing.dataDir}";
		user = "1u5t1n14n";
	};

}
