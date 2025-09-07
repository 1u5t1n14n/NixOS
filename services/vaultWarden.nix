{ config, ... }:

let
	cfg = config.services.vaultwarden;

in
{

	services.vaultwarden = {
		enable = true;

		#dbbackend = "sqlite";

		config = {
			ROCKET_ADDRESS = "0.0.0.0";
			ROCKET_PORT = 8222;
			SIGNUPS_ALLOWED = true;
		};
	};

	networking.firewall.allowedTCPPorts = [ cfg.config.ROCKET_PORT ];

}
