{ ... }:

{

	ervices.code-server = {
		enable = true;
		host = "0.0.0.0";
		port = 8080;
	};

	networking.firewall.allowedTCPPorts = [ 8080 ];

}
