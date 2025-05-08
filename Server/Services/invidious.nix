{ config, ... }:

{

	services.invidious = {
		enable = true;
		port = 8880;
	};

	networking.firewall.allowedTCPPorts = [ config.services.invidious.port ];

}
