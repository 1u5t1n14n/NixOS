{ config, ... }:

{

	imports = [
		./applications.nix
		./keybindings.nix
	];

	dconf.settings = {
		"org/gnome/desktop/background" = {
			show-desktop-icons = true;
			picture-uri-dark = "file://${config.home.homeDirectory}/Pictures/Wallpapers/WallpaperDark.jpg";
			picture-uri = "file://${config.home.homeDirectory}/Pictures/Wallpapers/Wallpaper.png";
		};
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			icon-theme = "MoreWaita";
			clock-show-date = false;
		};
		"org/gnome/desktop/sound" = {
			event-sounds = false;
		};
		"org/gnome/gnome-session" = {
			logout-prompt = false;
		};
		"org/gnome/settings-daemon/plugins/power" = {
			power-button-action = "interactive";
			power-saver-profile-on-low-battery = true;
			sleep-inactive-battery-type = "nothing";
			sleep-inactive-battery-timeout = 0;
			sleep-inactive-ac-type = "nothing";
			sleep-inactive-ac-timeout = 0;
		};
		"org/gnome/shell" = {
			remember-mount-password = true;
			disable-user-extensions = false;
			enabled-extensions = [
				"unite@hardpixel.eu"
				"dock-from-dash@fthx"
				"blur-my-shell@aunetx"
				"transparent-window-moving@noobsai.github.com"
				"native-window-placement@gnome-shell-extensions.gcampax.github.com"
				"gsconnect@andyholmes.github.io"
				"launch-new-instance@gnome-shell-extensions.gcampax.github.com"
				"drive-menu@gnome-shell-extensions.gcampax.github.com"
				"just-perfection-desktop@just-perfection"
			];
		};
		"org/gnome/shell/extensions/unite" = {
			hide-window-titlebars = "always";
			show-window-buttons = "never";
			show-window-title = "never";
		};
		"org/gnome/shell/extensions/just-perfection" = {
			dash = false;
			dash-separator = true;
			activities-button = false;
			overlay-key = false;
			startup-status = 0;
			workspace-wrap-around = true;
		};
		"org/gnome/shell/app-switcher" = {
			current-workspace-only = true;
		};
		"org/gnome/desktop/wm/preferences" = {
			focus-mode = "mouse";
			auto-raise = false;
			audible-bell = false;
			resize-with-right-button = true;
		};
		"org/gnome/mutter" = {
			edge-tiling = true;
			dynamic-workspaces = true;
			workspaces-only-primary = true;
			center-new-windows = false;
		};
		"org/gnome/desktop/privacy" = {
			remove-old-temp-files = true;
			remove-old-trash-files = true;
			disable-camera = true;
			remember-app-usage = false;
		};
	};

}
