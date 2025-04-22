{ pkgs, config, ... }:

let
	jellyfin = config.services.jellyfin;

in {

	services.jellyfin = {
		enable = true;
		user = "nextcloud";
		group = "nextcloud";
	};

	environment.systemPackages = with pkgs; [
		jellyfin-web
		jellyfin-ffmpeg
	];

	systemd.tmpfiles.rules = [
		"d ${jellyfin.dataDir} 0770 ${jellyfin.user} ${jellyfin.group} - -"
	];

	services.nginx.virtualHosts."localhost" = {
		locations = {
			"/jellyfin/".proxyPass = "http://127.0.0.1:8096";
			proxyWebsockets = true;
			extraConfig = ''
				proxy_set_header Host $host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Forwarded-Proto $scheme;
				proxy_set_header X-Script-Name /immich;
				proxy_buffering off;
				proxy_redirect off;
				client_max_body_size 20M;
			'';
		};
	};

}
