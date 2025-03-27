{ ... }:

let
	font = "JetBrainsMono Nerd Font";

in {

	programs.zed-editor = {
		enable = true;
		extensions = [ "html" "nix" "typst" ];
		userSettings = {
			vim_mode = true;
			features.copilot = true;
			telemetry = {
				metrics = false;
				diagnostics = false;
			};
			theme = {
				mode = "dark";
				dark = "Andromeda";
				light = "Gruvbox Light Soft";
			};
			active_pane_modifiers.border_size = 0.0;
			autosave = "off";
			restore_on_startup = "none";
			buffer_font_family = "${font}";
			terminal.font_family = "${font}";
			ui_font_family = "${font}";
			dock = "right";
			cursor_blink = false;
			cursor_shape = "block";
			tab_bar.show = false;
			toolbar = {
				breadcrumbs = false;
				quick_actions = false;
			};
			always_treat_brackets_as_autoclosed = true;
			hour_format = "hour24";
		};
	};

}
