{ config, lib, ... }:

let
	cfg = config.services.vaultwarden;

in
{

	services.vaultwarden = {
		config = {
			ROCKET_ADDRESS = "127.0.0.1";
			ROCKET_PORT = 8222;
			SIGNUPS_ALLOWED = false;
		};
	};

	networking.firewall.allowedTCPPorts = lib.mkIf (cfg.enable && (cfg.config.ROCKET_ADDRESS == "0.0.0.0")) [ cfg.config.ROCKET_PORT ];

}
