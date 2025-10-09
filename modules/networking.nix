{ host, config, lib, ... }:

let
	mkWifiConfig = ssid: {
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
			# Make Variable Lower Case
			psk = "$" + lib.toLower ssid;
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
			enable = !config.networking.wireless.enable;
			ensureProfiles = {
				environmentFiles = [ config.sops.templates.wifi.path ];

				profiles = {
					trautesheim = mkWifiConfig "trautesheim";
					kant = mkWifiConfig "kant";
					Paulina = mkWifiConfig "Paulina";
					Pixel = mkWifiConfig "Pixel";
				};
			};
		};

		wireless = {
			enable = false;
			secretsFile = config.sops.templates.wifi.path;
			networks = {
				Paulina.psk = "ext:paulina";
				Pixel.psk = "ext:pixel";
				kant.psk = "ext:kant";
				trautesheim.psk = "ext:trautesheim";
			};
		};
	};

	sops = {
		secrets = {
			"networking/paulina" = { };
			"networking/pixel" = { };
			"networking/kant" = { };
			"networking/trautesheim" = { };
		};
		templates.wifi = {
			owner = "root";
			content = ''
				paulina=${config.sops.placeholder."networking/paulina"}
				pixel=${config.sops.placeholder."networking/pixel"}
				kant=${config.sops.placeholder."networking/kant"}
				trautesheim=${config.sops.placeholder."networking/trautesheim"}
			'';
		};
	};

}
