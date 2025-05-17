{ pkgs, ... }:

{

	environment.gnome.excludePackages = with pkgs; [
		cheese
		gnome-connections
		gnome-console
		gnome-logs
		gnome-music
		gnome-software
		gnome-tour
		gnome-weather
		nixos-render-docs
		seahorse
		simple-scan
		snapshot
		yelp
		geary
		totem
	];

	environment.systemPackages = with pkgs; [
		citations
		decibels
		errands
		gnome-secrets
		gnome-tweaks
		impression
		morewaita-icon-theme
		paper-clip
		papers
		pdfarranger
		warp

		xdg-desktop-portal
		xdg-desktop-portal-gtk
	];

	xdg.mime.defaultApplications = {
		"inode/directory" = [ "org.gnome.Nautilus.desktop" ];
	};

}
