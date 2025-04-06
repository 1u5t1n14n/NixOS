{ config, ... }:

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

	system.activationScripts.pyloadDirectoryManager = ''
		mkdir -p ${pyload.downloadDirectory}
		chown -R ${pyload.user}:${pyload.group} ${pyload.downloadDirectory}
	'';

}
