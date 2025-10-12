{ host, config, lib, ... }:

let
	mkWifiConfig = { ssid, extVar, ... }: {
		connection = {
			type = "wifi";
			id = ssid;
			permissions = "";
		};
		wifi = {
			ssid = ssid;
			mode = "infrastructure";
		};
		wifi-security = {
			psk = "$" + extVar;
			key-mgmt = "wpa-psk";
		};
		ipv4.method = "auto";
	};

in
{

	networking = {
		hostName = host.name;

		firewall.enable = true;
		nftables.enable = config.networking.firewall.enable;

		networkmanager = {
			enable = true;
			ensureProfiles = {
				environmentFiles = [ config.sops.templates.wifi.path ];

				profiles = {
					trautesheim = mkWifiConfig {
						ssid = "trautesheim";
						extVar = "trautesheim";
					};
					kant = mkWifiConfig {
						ssid = "kant";
						extVar = "kant";
					};
					Paulina = mkWifiConfig {
						ssid = "Paulina";
						extVar = "paulina";
					};
					Wanzka = mkWifiConfig {
						ssid = "FRITZ!Wanzka KKBSO";
						extVar = "wanzka";
					};
					Pixel = mkWifiConfig {
						ssid = "Pixel";
						extVar = "pixel";
					};
				};
			};
		};

		wireless = {
			enable = !config.networking.networkmanager.enable;
			secretsFile = config.sops.templates.wifi.path;
			networks = {
				Paulina.psk = "ext:paulina";
				Pixel.psk = "ext:pixel";
				kant.psk = "ext:kant";
				trautesheim.psk = "ext:trautesheim";
				"Fritz!Wanzka KKBSO".psk = "ext:wanzka";
			};
		};
	};

	sops = {
		secrets = {
			"networking/paulina" = { };
			"networking/pixel" = { };
			"networking/kant" = { };
			"networking/trautesheim" = { };
			"networking/wanzka" = { };
		};
		templates.wifi = {
			content = ''
				paulina=${config.sops.placeholder."networking/paulina"}
				pixel=${config.sops.placeholder."networking/pixel"}
				kant=${config.sops.placeholder."networking/kant"}
				trautesheim=${config.sops.placeholder."networking/trautesheim"}
				wanzka=${config.sops.placeholder."networking/wanzka"}
			'';
		};
	};

}
