{ config, inputs, system, ... }:

let
	pyload = config.services.pyload;

in {

	services.pyload = {
		enable = true;
		listenAddress = "0.0.0.0";
		user = "nextcloud";
		group = "nextcloud";
	};

	networking.firewall.allowedTCPPorts = [ pyload.port ];

	systemd.tmpfiles.rules = [
		"d ${pyload.downloadDirectory} 0770 ${pyload.user} ${pyload.group} - -"
	];

}
