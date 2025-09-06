{ osConfig, config, lib, ... }:

let
	kb = osConfig.services.xserver.xkb;

in
{

	imports = [
		./binds.nix
		./waybar.nix
	];

	wayland.windowManager.hyprland = {
		enable = osConfig.programs.hyprland.enable;

		package = null;
		portalPackage = null;

		settings = {
			monitor = ",preferred,auto,1.0";

			exec-once = [
				"swww init"
				"waypaper --restore"
			]

			++ lib.optionals config.programs.waybar.enable [
				"waybar"
			];

			env = [
				"HYPRCURSOR_SIZE,${toString config.gtk.cursorTheme.size}"
			];

			ecosystem.no_update_news = true;

			xwayland.force_zero_scaling = true;

			general = {
				gaps_in = 5;
				gaps_out = 20;

				border_size = 0;
				no_border_on_floating = true;

				resize_on_border = false;

				allow_tearing = false;

				layout = "dwindle";

				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";
			};

			decoration = {
				rounding = 10;
				rounding_power = 2;

				active_opacity = 0.8;
				inactive_opacity = 0.8;
				fullscreen_opacity = 1.0;

				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};

				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

			animations = {
				# Default, for now :)
				enabled = true;

				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
					"zoomFactor, 1, 7, quick"
				];
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master.new_status = "master";
			
			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};

			input = {
				kb_layout = kb.layout;
				kb_variant = kb.variant;
				kb_model = kb.model;
				kb_options = kb.options;
				kb_rules = "";

				numlock_by_default = true;

				focus_on_close = 0;
				follow_mouse = 1;
				sensitivity = 0;

				touchpad.natural_scroll = true;
			};

			gestures.workspace_swipe = true;
		};
	};

}
