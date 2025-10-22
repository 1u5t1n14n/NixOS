{ host, ... }:

{

	dconf.settings = {
		"org/gnome/settings-daemon/plugins/media-keys" = {
			calculator = [ "Calculator" ];
			control-center = [ "<Alt>comma" ];
			www = [ "<Alt>2" ];
			home = [ "<Alt>3" ];
			email = [ "<Alt>4" ];
		};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
			name = "WezTerm";
			binding = "<Alt>Return";
			command = "wezterm";
		};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
			name = "Vicinae";
			binding = "<Alt>space";
			command = "vicinae toggle";
		};
		"org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
			"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
			"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
		];

		"org/gnome/shell/app-switcher".current-workspace-only = true;
		"org/gnome/shell/keybindings" = {
			screenshot = [ "Print" ];
			show-screenshot-ui = [ "<Shift><Super>s" ];

			toggle-quick-settings = [ "<Shift><Alt>comma" ];
			toggle-application-view = [ "<Shift><Alt>Return" ];

			toggle-tiled-left = [ "<Alt>h" ];
			toggle-tiled-right = [ "<Alt>l" ];
		};

		"org/gnome/desktop/input-sources".xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "compose:rctrl" ];

		"org/gnome/desktop/wm/preferences" = {
			focus-mode = "mouse";
			auto-raise = false;
			audible-bell = false;
			mouse-button-modifier = "<Alt>";
		};

		"org/gnome/desktop/wm/keybindings" = {
			toggle-maximized = [ "<Alt>s" ];
			toggle-fullscreen = [ "F11" ];

			close = [ "<Alt>q" ];
			minimize = [ "<Alt>minus" ];
			always-on-top = [ "<Alt><Shift>p" ];
			activate-window-menu = [ "<Super>comma" ];

			switch-applications = [ "<Alt>Tab" ];
			switch-applications-backward = [ "<Shift><Alt>Tab" ];

			switch-to-workspace-right = [ "<Super>l" ];
			switch-to-workspace-left = [ "<Super>h" ];
			move-to-workspace-left = [ "<Super><Shift>h" ];
			move-to-workspace-right = [ "<Super><Shift>l" ];

			move-to-side-e = [ "<Alt><Shift>l" ];
			move-to-side-n = [ "<Alt><Shift>k" ];
			move-to-side-s = [ "<Alt><Shift>j" ];
			move-to-side-w = [ "<Alt><Shift>h" ];
			move-to-center = [ "<Alt>c" ];

			show-desktop = [ "<Alt>F3" ];
		};
	};

}
