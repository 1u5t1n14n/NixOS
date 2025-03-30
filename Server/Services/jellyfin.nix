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
		group = "${jellyfin.group}";
	};

	users.users.jellyfinData = {
		home = "/var/lib/jellyfinData";
		createHome = true;
		homeMode = "777";
		description = "Library Manager for Jellyfin";
		group = "jellyfinData";
		isSystemUser = true;
	};
	users.groups.jellyfinData = {};

}
