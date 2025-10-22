{ host, ... }:

let
	font = "JetBrainsMono Nerd Font";

in
{

	programs.zed-editor = {
		enable = host.hasDesktop;

		package = null;

		extensions = [
			"catppuccin"

			"html"
			"nix"
			"typst"
			"c"
		];

		userSettings = {
			disable_ai = true;

			when_closing_with_no_tabs = "close_window";
			on_last_window_closed = "quit_app";

			active_pane_modifiers = {
				inactive_opacity = 1.0;
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
				dark = "Catppuccin Mocha";
				light = "Catppuccin Frappé";
			};

			autosave = "off";
			auto_update = false;

			telemetry = {
				metrics = false;
				diagnostics = false;
			};
			vim_mode = true;

			restore_on_startup = "none";

			cursor_blink = false;
			cursor_shape = "block";
			always_treat_brackets_as_autoclosed = true;
			scroll_beyond_last_line = "off";
			autoscroll_on_clicks = true;
			show_whitespaces = "trailing";
		};
	};

}
