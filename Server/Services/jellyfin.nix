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

	system.activationScripts.jellyfinLibrarySetup = ''
		if [ ! -d "/var/lib/jellyfin/Movies" ]; then
			mkdir -p /var/lib/jellyfin/Movies
			sudo chown -R jellyfin:jellyfin /var/lib/jellyfin/Movies
		fi
	'';

}
