{ pkgs, config, ... }:

let
	jellyfin = config.services.jellyfin;

in {

	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "jellyfin";
		group = "jellyfin";
	};

	environment.systemPackages = with pkgs; [
		jellyfin-web
		jellyfin-ffmpeg
	];

	users.users.jellyfin = {
		home = "/var/lib/jellyfin";
		createHome = true;
		description = "Jellyfin";
		group = "jellyfin";
	};

	system.activationScripts.jellyfinPermissionManager = ''
		mkdir -p ${config.users.users.jellyfin.home}
		chown -R ${jellyfin.user}:${jellyfin.group} /var/lib/jellyfin
	'';

}
