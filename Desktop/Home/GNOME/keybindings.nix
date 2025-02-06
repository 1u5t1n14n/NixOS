{ ... }:

{

	dconf.settings = {
		"org/gnome/settings-daemon/plugins/media-keys" = {
			logout = ["<Alt>escape"];
		};
		"org/gnome/desktop/wm/preferences" = {
			mouse-button-modifier = "<Alt>";
		};
		"org/gnome/desktop/wm/keybindings" = {
			toggle-maximized = ["<Alt>s"];
			toggle-fullscreen = ["F11"];
			activate-window-menu = ["<Alt>comma"];
			close = ["<Alt>q"];
			minimize = ["<Alt>minus"];
			always-on-top = ["<Alt><Shift>p"];
			switch-to-workspace-right = ["<Super>l"];
			switch-to-workspace-left = ["<Super>h"];
			move-to-workspace-left = ["<Super><Shift>h"];
			move-to-workspace-right = ["<Super><Shift>l"];
			move-to-side-e = ["<Alt><Shift>l"];
			move-to-side-n = ["<Alt><Shift>k"];
			move-to-side-s = ["<Alt><Shift>j"];
			move-to-side-w = ["<Alt><Shift>h"];
			move-to-center = ["<Alt>c"];
			show-desktop = ["<Super>F3"];
		};
		"org/gnome/shell/keybindings" = {
			shift-overview-down = ["<Super>Down"];
			shift-overview-up = ["<Super>Up"];
			toggle-quick-settings = ["<Super>comma"];
			toggle-overview = ["<Alt>space"];
			toggle-message-tray = ["<Super>n"];
			open-new-window-application-1 = ["<Alt>1"];
			open-new-window-application-2 = ["<Alt>2"];
			open-new-window-application-3 = ["<Alt>3"];
			open-new-window-application-4 = ["<Alt>4"];
			open-new-window-application-5 = ["<Alt>5"];
			open-new-window-application-6 = ["<Alt>6"];
			open-new-window-application-7 = ["<Alt>7"];
			open-new-window-application-8 = ["<Alt>8"];
			open-new-window-application-9 = ["<Alt>9"];
			switch-to-application-1 = ["<Alt><Shift>1"];
			switch-to-application-2 = ["<Alt><Shift>2"];
			switch-to-application-3 = ["<Alt><Shift>3"];
			switch-to-application-4 = ["<Alt><Shift>4"];
			switch-to-application-5 = ["<Alt><Shift>5"];
			switch-to-application-6 = ["<Alt><Shift>6"];
			switch-to-application-7 = ["<Alt><Shift>7"];
			switch-to-application-8 = ["<Alt><Shift>8"];
			switch-to-application-9 = ["<Alt><Shift>9"];
		};
	};

}
