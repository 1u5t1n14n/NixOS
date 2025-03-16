{ config, ... }:

{

	services.nginx.enable = true;
	#services.nginx.virtualHosts."localhost" = {
	#	locations = {
	#		"/calibre".proxyPass = "http://localhost:${toString config.services.calibre-web.listen.port}";
	#		"/pdf".proxyPass = "http://localhost:${toString config.services.stirling-pdf.environment.SERVER_PORT}";
	#		"/search".proxyPass = "http://localhost:${toString config.services.searx.settings.server.port}";
	#		"/jellyfin".proxyPass = "http://localhost:8096";
	#		"/paperless".proxyPass = "http://localhost:${toString config.services.paperless.port}";
	#		"/codeserver".proxyPass = "http://localhost:${toString config.services.code-server.port}";
	#	};
	#};

	networking = {
		firewall = {
			allowedTCPPorts = [ 80 443 ];
		};
		domain = "local";
	};

}
