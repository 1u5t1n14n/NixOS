{ config, pkgs, ... }:

{

	environment.systemPackages = [ pkgs.apacheHttpd ];

	services.radicale = {
		enable = true;
		settings = {
			server.hosts = [ "0.0.0.0:5232" ];
			auth = {
				type = "htpasswd";
				htpasswd_filename = "${config.users.users.radicale.home}/users";
				htpasswd_encryption = "bcrypt";
			};
			storage.filesystem_folder = "${config.users.users.radicale.home}/collections";
		};
	};

	services.nginx.virtualHosts."cal.${hostName}.${config.networking.domain}".locations."/" = {
		proxyPass = "http://127.0.0.1:5232";
	};

	# sudo htpasswd -B(c) /var/lib/radicale/users username
	users.users.radicale = {
		isSystemUser = true;
		group = "radicale";
		home = "/var/lib/radicale";
		createHome = true;
	};
	users.groups.radicale = {};

	system.activationScripts.radicaleSetup = ''
		if [ ! -d "${config.services.radicale.settings.storage.filesystem_folder}" ]; then
			mkdir -p /var/lib/radicale/collections
			chown -R radicale:radicale /var/lib/radicale
		fi
	'';

	networking.firewall.allowedTCPPorts = [ 5232 ];

}
