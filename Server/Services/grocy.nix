{ config, ... }:

{

	services.grocy = {
		hostName = "grocy.local";
		settings.currency = "EUR";
	};

	services.nginx.virtualHosts."grocy.local".locations."/" = {
		proxyPass = "http://127.0.0.1:${toString config.services.grocy.port}";
	};

}
