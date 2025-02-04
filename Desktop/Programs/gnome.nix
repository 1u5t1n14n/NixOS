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
		totem
		yelp
		geary
	];

	environment.systemPackages = with pkgs; [
		alpaca
		ascii-draw
		bottles
		citations
		dconf-editor
		decibels
		errands
		foliate
		gapless
		geopard
		gnome-graphs
		gnome-secrets
		gnome-tweaks
		hydrapaper
		impression
		junction
		key-rack
		kooha
		mission-center
		morewaita-icon-theme
		mousam
		paper-clip
		papers
		warp

		xdg-desktop-portal
		xdg-desktop-portal-gtk
	];

	xdg.mime.defaultApplications = {
		"inode/directory" = [ "org.gnome.Nautilus.desktop" ];
	};

}
