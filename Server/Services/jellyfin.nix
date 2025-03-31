{ pkgs, config, ... }:

let
	jellyfin = config.services.jellyfin;

in {

	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "nextcloud";
		group = "nextcloud";
	};

	environment.systemPackages = with pkgs; [
		jellyfin-web
		jellyfin-ffmpeg
	];

	system.activationScripts.jellyfinDirectoryCreation = ''
		mkdir -p /var/lib/${jellyfin.dataDir}/Library
		chown -R ${jellyfin.user}:${jellyfin.group} /var/lib/${jellyfin.dataDir}
	'';

}
