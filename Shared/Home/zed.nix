{ ... }:

let
	font = "JetBrainsMono Nerd Font";

in {

	programs.zed-editor = {
		enable = true;
		extensions = [ "html" "nix" "typst" ];
		userSettings = {
			active_pane_modifiers = {
				inactive_opacity = 0.9;
				border_size = 0.0;
			};
			autosave = "off";
			cursor_shape = "block";
			hide_mouse = "on_typing";
			auto_update = false;
			scrollbar = {
				show = "never";
			};
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
			restore_on_startup = "none";
			buffer_font_family = font;
			terminal.font_family = font;
			ui_font_family = font;
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
