{ pkgs, config, ... }:

let
	calibre = config.services.calibre-web;

in {

	services.calibre-web = {
		enable = true;
		listen = {
			ip = "127.0.0.1";
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
		if [ ! -f "/var/lib/${calibre.dataDir}/metadata.db" ]; then
			${pkgs.wget}/bin/wget https://github.com/janeczku/calibre-web/raw/master/library/metadata.db -O /var/lib/${calibre.dataDir}/metadata.db
		fi
	'';

	systemd.tmpfiles.rules = [
		"d /var/lib/${calibre.dataDir} 0700 ${calibre.user} ${calibre.group} - -"
	];

	services.nginx.virtualHosts."localhost" = {
		locations."/library" = {
			proxyPass = "http://${calibre.listen.ip}:${toString calibre.listen.port}";
			proxyWebsockets = true;
			extraConfig = ''
			proxy_bind $server_addr;
			proxy_redirect	http://$server_addr	/;
			proxy_set_header Host $host;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header X-Scheme $scheme;
			proxy_set_header X-Script-Name /library;
			client_max_body_size 1024M;
			'';
		};
	};

}
