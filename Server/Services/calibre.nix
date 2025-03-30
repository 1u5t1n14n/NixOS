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
		if [ ! -f "/var/lib/openDir/Books/metadata.db" ]; then
			cd /var/lib/openDir/Books
			sudo -u calibre-web ${pkgs.wget}/bin/wget https://github.com/janeczku/calibre-web/raw/master/library/metadata.db
		fi
	'';

}
