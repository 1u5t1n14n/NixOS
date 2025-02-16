{ pkgs, ... }:

{

	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "jellyfin";
		group = "jellyfin";
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
		extraGroups = [ "jellyfin" ];
	};

	users.groups.jellyfin = {};

}
