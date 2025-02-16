{ hostName, ... }:

{

	services.nginx = {
		enable = true;
		virtualHosts."0.0.0.0" = {
			root = "/var/www/${hostName}";
		};
	};

	networking.firewall.allowedTCPPorts = [ 80 ];

}
