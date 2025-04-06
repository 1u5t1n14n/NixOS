{ config, inputs, system, ... }:

let
	pyload = config.services.pyload;

in {

	services.pyload = {
		enable = true;
		package = inputs.nixpkgsStable.legacyPackages."${system}".pyload-ng;
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
