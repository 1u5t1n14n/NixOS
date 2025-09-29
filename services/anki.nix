{ ... }:

{

	services.anki-sync-server = {
		enable = true;

		port = 27701;
		address = "0.0.0.0";
		openFirewall = true;

		users.main = {
			username = host.user;
			passwordFile = config.sops.secrets."".path;
		};
	};

}
