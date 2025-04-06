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

	systemd.tmpfiles.rules = [
		"d /var/lib/${jellyfin.dataDir} 0770 ${jellyfin.user} ${jellyfin.group} - -"
	];
}
