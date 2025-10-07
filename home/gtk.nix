{ pkgs, config, host, ... }:

let
	cfg = config.gtk;

in {

	gtk = {
		enable = host.hasDesktop;

		font = {
			name = "Inter";
			package = pkgs.inter;
			size = 11;
		};

		cursorTheme = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
			size = 24;
		};

		iconTheme = {
			name = "MoreWaita";
			package = pkgs.morewaita-icon-theme;
		};

		gtk3.extraConfig = {
			gtk-application-prefer-dark-theme = 1;
		};

		gtk4.extraConfig = {
			gtk-application-prefer-dark-theme = 1;
		};
	};

	home.pointerCursor = {
		name = cfg.cursorTheme.name;
		package = cfg.cursorTheme.package;
		size = cfg.cursorTheme.size;

		gtk.enable = cfg.enable;
		x11.enable = host.hasDesktop;
	};

}
