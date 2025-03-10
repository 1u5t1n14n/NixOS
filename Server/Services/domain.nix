{ config, hostName, ... }:

{

	services.nginx.enable = true;

	networking = {
		firewall = {
			allowedTCPPorts = [ 80 443 ];
		};
		domain = "local";
	};

}
