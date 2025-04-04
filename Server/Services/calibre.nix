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
	};

	system.activationScripts.calibreDatabaseDownload = ''
		mkdir -p /var/lib/${calibre.dataDir}
		if [ ! -f "/var/lib/calibreWeb/metadata.db" ]; then
			cd /var/lib/${calibre.dataDir}
			${pkgs.wget}/bin/wget https://github.com/janeczku/calibre-web/raw/master/library/metadata.db
		fi
		chown -R ${calibre.user}:${calibre.group} /var/lib/${calibre.dataDir}
	'';

}
