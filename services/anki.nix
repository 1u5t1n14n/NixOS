{ config, host, ... }:

{

	services.anki-sync-server = {
		enable = true;

		port = 27701;
		address = "0.0.0.0";
		openFirewall = true;

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
