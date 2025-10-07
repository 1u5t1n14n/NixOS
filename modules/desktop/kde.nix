{ pkgs, ... }:

{

	services = {
		desktopManager.plasma6.enable = true;
		displayManager.defaultSession = null;

		orca.enable = false;
	};

	environment.plasma6.excludePackages = with pkgs.kdePackages; [
		dolphin konsole aurorae plasma-browser-integration kwin-x11 ark elisa
		gwenview okular kate ktexteditor khelpcenter baloo-widgets
		dolphin-plugins spectacle ffmpegthumbs krdp xwaylandvideobridge
	];

}
