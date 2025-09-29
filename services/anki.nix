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
				passwordFile = config.sops.secrets."services/anki".path;
			}
		];
	};

	sops.secrets.ankiServer = {
		key = "services/anki";
	};

	sops.secrets.ankiHome = {
		owner = host.user;
		key = "services/anki";
	};

}
