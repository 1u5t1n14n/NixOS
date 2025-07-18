{ config, ... }:

{

	services.send = {
		enable = true;

		host = "0.0.0.0";
		port = 1443;
		openFirewall = true;

		redis = {
			createLocally = true;
			passwordFile = config.sops.secrets."services/send".path;
		};
	};

}
