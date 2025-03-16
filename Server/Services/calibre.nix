{ pkgs, config, ... }:

let
	calibre = services.calibre-web;

in {

	services.calibre-web = {
		enable = true;
		listen = {
			ip = "0.0.0.0";
			port = 8083;
		};
		options = {
			enableBookConversion = true;
			enableBookUploading = true;
		};
		dataDir = "calibreWeb";
		user = "calibreweb";
		group = "cloudaccess";
	};

	users.users.calibreweb = {
		isNormalUser = true;
		home = "/var/lib/calibreWeb";
		createHome = true;
		description = "Calibre-Web";
		extraGroups = [ "${calibre.group}" ];
	};

	networking.firewall.allowedTCPPorts = [ calibre.listen.port ];

	system.activationScripts.calibreDatabaseDownload = ''
		mkdir -p /var/lib/calibreWeb/collections
		if [ ! -f "/var/lib/calibreWeb/metadata.db" ]; then
			cd /var/lib/calibreWeb
			${pkgs.wget}/bin/wget https://github.com/janeczku/calibre-web/raw/master/library/metadata.db
		fi
		chown -R ${calibre.user}:${calibre.group} /var/lib/calibreWeb
	'';

}
