{ ... }:

{

	services.nginx.enable = true;

	networking.firewall.allowedTCPPorts = [ 80 443 ];
	networking.domain = "local";

}
