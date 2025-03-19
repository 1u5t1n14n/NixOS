{ pkgs, config, ... }:

let
	jellyfin = config.services.jellyfin;

in {

	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "jellyfin";
		group = "cloudaccess";
	};

	environment.systemPackages = with pkgs; [
		jellyfin-web
		jellyfin-ffmpeg
	];

	users.users.jellyfin = {
		home = "/var/lib/jellyfin";
		homeMode = "770";
		createHome = true;
		description = "Jellyfin";
		group = "${jellyfin.group}";
	};

	system.activationScripts.jellyfinPermissionManager = ''
		mkdir -p ${config.users.users.jellyfin.home}
		chown -R ${jellyfin.user}:${jellyfin.group} /var/lib/jellyfin
	'';

}
