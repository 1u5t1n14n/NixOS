{ userName, ... }:

{

	services.code-server = {
		enable = true;
		host = "0.0.0.0";
		port = 8080;
		user = "${userName}";
		group = "users";
	};

	networking.firewall.allowedTCPPorts = [ 8080 ];

}
