{ config, ... }:

{

	services.onlyoffice = {
		enable = true;
		port = 5232;
	};

	networking.firewall.allowedTCPPorts = [ config.services.onlyoffice.port ]

}
