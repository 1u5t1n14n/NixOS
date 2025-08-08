{ pkgs, host, ... }:

{

	dconf.settings = {
		"org/gnome/shell" = {
			disable-user-extensions = false;
			enabled-extensions = with pkgs.gnomeExtensions; [
				valent.extensionUuid
				launch-new-instance.extensionUuid
				blur-my-shell.extensionUuid
				native-window-placement.extensionUuid
				just-perfection.extensionUuid
				dash-to-dock.extensionUuid
				media-controls.extensionUuid
				unite.extensionUuid
				hide-activities-button.extensionUuid
			];
		};

		"org/gnome/shell/extensions/blur-my-shell/dash-to-dock".blur = false;
		"org/gnome/shell/extensions/dash-to-dock" = {
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
			dash-separator = true;
			overlay-key = false;

			# Desktop
			startup-status = 0;
			workspace-wrap-around = true;

			# Clock on the Right
			clock-menu-position = 1;
		};
	};

}
