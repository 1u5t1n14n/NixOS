{ config, host, ... }:

let
	cfg = config.services.writefreely;

in
{

	services.writefreely = {
		enable = true;

		admin = {
			name = host.user;
			initialPasswordFile = config.sops.secrets."services/write".path;
		};

		host = "0.0.0.0";

		settings = {
			server.port = 3002;
		};
	};

	networking.firewall.allowedTCPPorts = [ cfg.settings.server.port ];

}
