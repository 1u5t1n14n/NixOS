{ userName, config, ... }:

let
	code = config.services.code-server;

in {

	services.code-server = {
		enable = true;
		host = "127.0.0.1";
		port = 8080;
		user = "${userName}";
		group = "users";
		disableTelemetry = true;
		auth = "none";
	};

	services.nginx.virtualHosts."localhost" = {
		locations = {
			"/code/".proxyPass = "http://${code.host}:${toString code.port}";
			proxyWebsockets = true;
			extraConfig = ''
				proxy_set_header Host $host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Forwarded-Proto $scheme;
				proxy_set_header X-Script-Name /code;
				proxy_redirect off;
				client_max_body_size 1024M;
			'';
		};
	};

}
