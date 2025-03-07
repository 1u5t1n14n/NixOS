{ config, hostName, ... }:

{

	services.nginx.enable = true;

	networking = {
		firewall = {
			allowedTCPPorts = [ 80 443 53 ];
			allowedUDPPorts = [ 53 ];
		};
		networkmanager.insertNameservers = [ "127.0.0.1" ];
		domain = "local";
	};

	services.avahi = {
		enable = true;
		nssmdns = true;
		publish = {
			enable = true;
			addresses = true;
			domain = true;
			hinfo = true;
			userServices = true;
			workstation = true;
		};
	};

	services.coredns = {
		enable = true;
		config = ''
			. {
				forward . 1.1.1.1 1.0.0.1
				cache
			}
			${hostName}.local {
				hosts {
					127.0.0.1 cal.${hostName}.${config.networking.domain}
				}
			}
		'';
	};

}
