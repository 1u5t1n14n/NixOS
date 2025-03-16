{ pkgs, ... }:

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
		jellyfin
		jellyfin-web
		jellyfin-ffmpeg
	];

	users.users.jellyfin = {
		home = "/var/lib/jellyfin";
		createHome = true;
		description = "Jellyfin";
		extraGroups = [ "cloudaccess" ];
	};

	system.activationScripts.jellyfinPermissionManager = ''
		mkdir -p /var/lib/jellyfin/
		chown -R ${jellyfin.user}:${jellyfin.group} /var/lib/jellyfin
	'';

}
