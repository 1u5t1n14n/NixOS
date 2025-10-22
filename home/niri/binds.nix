{ config, ... }:

let
	main = "Alt";
	mod = if main == "Alt" then "Mod" else "Alt";

in
{

	programs.niri.settings.binds = with config.lib.niri.actions; {
		# General Binds
		"${main}+Shift+Return" = {
			action = toggle-overview;
			repeat = false;
		};

		"${main}+Space".action = spawn "vicinae" "toggle";
		"${main}+Return".action = spawn "wezterm";

		"${main}+2".action = spawn "firefox";
		"${main}+3".action = spawn "nautilus";
		"${main}+4".action = spawn "thunderbird";

		"${mod}+Escape" = {
			action = toggle-keyboard-shortcuts-inhibit;
			allow-inhibiting = true;
		};

		"${mod}+Shift+E".action = quit;
		"${main}+Escape".action = quit;

		# Currently not available
		# Print.action = screenshot;
		# "${mod}+Print".action = screenshot-screen;
		# "${main}+Print".action = screenshot-window;

		# Window / Column Actions
		"${main}+Q" = {
			action = close-window;
			repeat = false;
		};

		"${main}+Plus".action = set-column-width "+10%";
		"${main}+Minus".action = set-column-width "-10%";

		"${main}+Shift+Plus".action = set-window-height "+10%";
		"${main}+Shift+Minus".action = set-window-height "-10%";

		"${main}+S".action = toggle-window-floating;
		"${main}+Shift+Tab".action = switch-focus-between-floating-and-tiling;
		"${main}+W".action = toggle-column-tabbed-display;

		"${main}+C".action = center-column;

		"${main}+Shift+S".action = maximize-column;
		"F11".action = fullscreen-window;

		"${mod}+R".action = switch-preset-window-width;
		"${mod}+Shift+R".action = switch-preset-window-width-back;
	};

}
