{ ... }:

{

	services.immich = {
		enable = true;
		port = 8800;
	};

	services.nginx.virtualHosts."localhost" = {
		locations = {
			"/immich/".proxyPass = "http://${config.services.immich.host}:${toString config.services.immich.port}";
			proxyWebsockets = true;
			extraConfig = ''
				proxy_set_header Host $host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Forwarded-Proto $scheme;
				proxy_set_header X-Script-Name /immich;
				proxy_redirect off;
				proxy_read_timeout 600s;
				proxy_send_timeout 600s;
				send_timeout       600s;
				client_max_body_size 50000M;
			'';
		};
	};

}
