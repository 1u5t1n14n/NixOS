{ host, osConfig, ... }:

{

	programs.anki = {
		enable = host.hasDesktop;

		language = "en_UK";

		style = "native";
		spacebarRatesCard = true;

		package = null;

		sync = {
			autoSync = true;
			autoSyncMediaMinutes = 0;

			url = "http://192.168.178.178:27701";
			username = host.user;
			passwordFile = osConfig.sops.secrets.ankiHome.path;
		};
	};

}
