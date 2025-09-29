{ host, ... }:

let
	font = "JetBrainsMono Nerd Font";

in
{

	programs.zed-editor = {
		enable = host.hasDesktop;

		extensions = [ "html" "nix" "typst" ];
		userSettings = {
			active_pane_modifiers = {
				inactive_opacity = 0.9;
				border_size = 0.0;
			};
			scrollbar.show = "never";
			hide_mouse = "on_typing";
			toolbar = {
				breadcrumbs = false;
				quick_actions = false;
			};
			tab_bar.show = false;

			buffer_font_family = font;
			terminal.font_family = font;
			ui_font_family = font;

			theme = {
				mode = "dark";
				dark = "Andromeda";
				light = "Gruvbox Light Soft";
			};

			autosave = "off";
			auto_update = false;

			telemetry = {
				metrics = false;
				diagnostics = false;
			};
			vim_mode = true;
			features.copilot = true;

			restore_on_startup = "none";
			dock = "right";

			cursor_blink = false;
			cursor_shape = "block";
			always_treat_brackets_as_autoclosed = true;
			hour_format = "hour24";
		};
	};

}
