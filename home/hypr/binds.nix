{ host, config, ... }:

{

	wayland.windowManager.hyprland.settings = {
			bind = [
				"ALT, Q, killactive"
				"ALT, S, togglefloating"
				"ALT, escape, exit"

				"ALT, return, exec, wezterm"
				"ALT, 2, exec, firefox"
				"ALT, 3, exec, nautilus"

				"ALT, space, exec, vicinae"
			];
	};

}
