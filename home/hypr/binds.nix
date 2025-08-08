{ host, config, lib, ... }:

{

	wayland.windowManager.hyprland.settings = {
			bind = [
				"ALT, Q, killactive"
				"ALT, S, togglefloating"
				"ALT, escape, exit"

				"ALT, return, exec, ${host.terminal}"
				"ALT, 2, exec, firefox"
				"ALT, 3, exec, nautilus"

			#",F11, togglefullscreen"
			]

			++ lib.optionals config.programs.rofi.enable [ "ALT, space, exec, rofi -show drun recursivebrowser" ]

			++ lib.optionals config.programs.walker.enable [ "ALT, space, exec, walker" ];
	};

}
