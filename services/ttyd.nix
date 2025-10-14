{ host, config, ... }:

let
	cfg = config.services.ttyd;

in
{

	services.ttyd = {
		enable = true;
		username = host.user;
		passwordFile = config.sops.secrets."services/ttyd".path;
		writeable = true;

		port = 7681;
	};

	networking.firewall.allowedTCPPorts = [ cfg.port ];

	sops.secrets."services/ttyd" = { };

}
