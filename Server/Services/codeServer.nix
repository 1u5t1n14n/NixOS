{ userName, config, ... }:

let
	code = config.services.code-server;

in {

	services = {
		code-server = {
			enable = true;
			host = "0.0.0.0";
			port = 8080;
			user = userName;
			group = config.users.users.${code.user}.group;
			disableTelemetry = true;
			auth = "none";
		};
	};

	networking.firewall.allowedTCPPorts = [ code.port ];

}
