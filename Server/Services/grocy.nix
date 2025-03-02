{ config, ... }:

{

	services.grocy = {
		enable = true;
		hostName = "grocy.home";
		settings = {
			currency = "EUR";
			culture = "de";
		};
	};

	services.nginx.virtualHosts."${config.services.grocy.hostName}" = {
		listen = [
			{ addr = "0.0.0.0"; port = 9283; }
		];
		locations."/" = {
			proxyPass = "http://127.0.0.1:9283";
		};
	};
	
	services.dnsmasq = {
		enable = true;
		settings.address = "/grocy.home/127.0.0.1";
	};

}
