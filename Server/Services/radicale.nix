{ pkgs, ... }:

{

	services.radicale = {
		enable = true;
		settings = {
			server.hosts = [ "0.0.0.0:5232" ];
			auth = {
				type = "htpasswd";
				htpasswd_filename = "/var/lib/radicale/users";
				htpasswd_encryption = "bcrypt";
			};
			storage.filesystem_folder = "/var/lib/radicale/collections";
		};
	};

	# sudo -u radicale nix-shell -p apacheHttpd --run "htpasswd -B -c /var/lib/radicale/users yourusername"
	users.users.radicale = {
		isSystemUser = true;
		group = "radicale";
		home = "/var/lib/radicale";
		createHome = true;
	};

	users.groups.radicale = {};

	system.activationScripts.radicaleSetup = ''
		if [ ! -d "/var/lib/radicale/collections" ]; then
			mkdir -p /var/lib/radicale/collections
			chown -R radicale:radicale /var/lib/radicale
		fi
	'';

	networking.firewall.allowedTCPPorts = [ 5232 ];

}
