{ config, ... }:

{

	services.stirling-pdf = {
		enable = true;
		environment.SERVER_PORT = 3000;
	};

	networking.firewall.allowedTCPPorts = [ config.services.stirling-pdf.environment.SERVER_PORT ];

}
