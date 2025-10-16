{ pkgs, host, ... }:

{

	dconf.settings = {
		"org/gnome/shell" = {
			disable-user-extensions = false;
			enabled-extensions = with pkgs.gnomeExtensions; [
				blur-my-shell.extensionUuid
				dash-to-dock.extensionUuid
				hide-activities-button.extensionUuid
				just-perfection.extensionUuid
				launch-new-instance.extensionUuid
				media-controls.extensionUuid
				native-window-placement.extensionUuid
				rounded-window-corners-reborn.extensionUuid
				unite.extensionUuid
				valent.extensionUuid
			];
		};

		"org/gnome/shell/extensions/rounded-window-corners-reborn".blacklist = [
			"Bitwarden"
		];

		"org/gnome/shell/extensions/blur-my-shell/dash-to-dock".blur = false;
		"org/gnome/shell/extensions/dash-to-dock" = {
			transparency-mode = "FIXED";
			background-opacity = 0.4;
			dock-position = "LEFT";
			dash-max-icon-size = 54;
			hot-keys = false;

			disable-overview-on-startup = true;
			show-mounts-network = true;
			show-trash = false;

			click-action = "launch";
			scroll-action = "cycle-windows";
		};
		"org/gnome/shell/extensions/unite" = {
			desktop-name-text = host.name;
			hide-window-titlebars = "always";
			show-window-buttons = "never";
			show-window-title = "never";
		};
		"org/gnome/shell/extensions/mediacontrols" = {
			show-control-icons-seek-backward = false;
			show-control-icons-seek-forward = false;
			show-player-icon = false;
			extension-position = "Right";
		};
		"org/gnome/shell/extensions/just-perfection" = {
			support-notifier-type = 0;

			dash-separator = true;
			overlay-key = false;

			# Desktop
			workspaces-in-app-grid = false;
			startup-status = 0;
			workspace-wrap-around = true;

			# Clock on the Right
			clock-menu-position = 1;
		};
	};

}
