{ config, ... }:

let
	stirling = config.services.stirling-pdf;

in {

	services.stirling-pdf = {
		enable = true;
		environment = {
			SERVER_PORT = 8088;
		};
	};

	networking.firewall.allowedTCPPorts = [ stirling.environment.SERVER_PORT ];

}
