{ config, host, ... }:

let
	cfg = config.services.anki-sync-server;

in
{

	services.anki-sync-server = {
		port = 27701;
		address = "0.0.0.0";
		openFirewall = (cfg.address == "0.0.0.0");

		users = [
			{
				username = host.user;
				passwordFile = config.sops.secrets."services/anki/main".path;
			}
			{
				username = "jonathan";
				passwordFile = config.sops.secrets."services/anki/jonathan".path;
			}
		];
	};

	sops.secrets."services/anki/main" = { };
	sops.secrets."services/anki/jonathan" = { };

}
