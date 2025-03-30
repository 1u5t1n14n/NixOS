{ pkgs, config, ... }:

let
	calibre = config.services.calibre-web;

in {

	services.calibre-web = {
		enable = true;
		listen = {
			ip = "0.0.0.0";
			port = 8083;
		};
		openFirewall = true;
		options = {
			enableBookConversion = true;
			enableBookUploading = true;
		};
		dataDir = "calibreWeb";
		user = "calibreweb";
		group = "calibreweb";
	};

	users.users.calibreweb = {
		isNormalUser = true;
		home = "/var/lib/calibreWeb";
		createHome = true;
		description = "Calibre-Web";
		group = "${calibre.group}";
	};
	users.groups."${calibre.group}" = {};

	system.activationScripts.calibreDatabaseDownload = ''
		mkdir -p /var/lib/calibreWeb/collections
		if [ ! -f "/var/lib/calibreWeb/metadata.db" ]; then
			cd /var/lib/calibreWeb
			${pkgs.wget}/bin/wget https://github.com/janeczku/calibre-web/raw/master/library/metadata.db
		fi
		chown -R ${calibre.user}:${calibre.group} ${config.users.users.calibreweb.home}
	'';

}
