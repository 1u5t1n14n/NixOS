{ userName, config, ... }:

let
	codeServer = config.services.code-server;

in {

	services.code-server = {
		enable = true;
		host = "0.0.0.0";
		port = 8080;
		user = "${userName}";
		group = "users";
	};

	networking.firewall.allowedTCPPorts = [ codeServer.port ];

}
