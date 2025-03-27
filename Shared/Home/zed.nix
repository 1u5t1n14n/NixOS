{ ... }:

{

	programs.zed-editor = {
		enable = true;
		extensions = [ "html" "nix" "typst" ];
		userSettings = {
			vim_mode = true;
			features.copilot = true;
			telemetry.metrics = false;
			theme = {
				mode = "dark";
				dark = "Andromeda";
			};
			active_pane_modifiers.border_size = 0.0;
			autosave = "off";
			restore_on_startup = "none";
			buffer_font_family = "JetBrains Mono";
			cursor_blink = false;
			cursor_shape = "block";
			tab_bar.show = false;
		};
	};

}
