{ pkgs, hostName, ... }:

let

	domain = "local";

in {

	environment.systemPackages = [ pkgs.openssl ];

	services.nginx = {
		enable = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;
		virtualHosts = {
			"search.${hostName}.${domain}" = {
				forceSSL = true;
				sslCertificate = "/etc/ssl/certs/search.${hostName}.${domain}.crt";
				sslCertificateKey = "/etc/ssl/private/search.${hostName}.${domain}.key";
				locations."/" = {
					proxyPass = "http://127.0.0.1:8888";
				};
			};
			"stirling.${hostName}.${domain}" = {
				forceSSL = true;
				sslCertificate = "/etc/ssl/certs/stirling.${hostName}.${domain}.crt";
				sslCertificateKey = "/etc/ssl/private/stirling.${hostName}.${domain}.key";
				locations."/" = {
					proxyPass = "http://127.0.0.1:8080";
				};
			};
		};
	};

	networking.domain = "${domain}";
	networking.extraHosts = ''
		127.0.0.1 search.${hostName}.${domain}
		127.0.0.1 stirling.${hostName}.${domain}
	'';

	systemd.services.generate-self-signed-cert = {
		description = "Generate self-signed certificate for search.${hostName}.${domain}";
		serviceConfig.Type = "oneshot";
		script = ''
			${pkgs.openssl}/bin/openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/search.${hostName}.${domain}.key -out /etc/ssl/certs/search.${hostName}.${domain}.crt -days 365 -nodes -subj '/CN=search.${hostName}.${domain}'
			${pkgs.openssl}/bin/openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/stirling.${hostName}.${domain}.key -out /etc/ssl/certs/stirling.${hostName}.${domain}.crt -days 365 -nodes -subj '/CN=stirling.${hostName}.${domain}'
			'';
		wantedBy = [ "multi-user.target" ];
		before = [ "nginx.service" ];
	};

	systemd.tmpfiles.rules = [
		"d /etc/ssl/private 0700 root root -"
	];

	services.resolved = {
		enable = true;
		dnssec = "false";
		domains = [ "~." ];
		fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
	};

	networking.networkmanager = {
		dns = "systemd-resolved";
	};
	networking.firewall = {
		allowedTCPPorts = [ 80 443 53 8000 ];
		allowedUDPPorts = [ 53 ];
	};

}
