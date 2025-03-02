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
		locations."/" = {
			proxyPass = "http://127.0.0.1:${toString config.services.grocy.port}";
		};
	};
	
	services.dnsmasq = {
		enable = true;
		settings.address = "/grocy.home/127.0.0.1";
	};

	security.acme = {
		acceptTerms = true;
		email = "acme.concerned782@passinbox.com";
		certs."grocy.home".webroot = "/var/lib/acme/acme-challenge";
	};

}
