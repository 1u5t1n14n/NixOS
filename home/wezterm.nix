{ osConfig, host, ... }:

{

	programs.wezterm = {
		enable = host.hasDesktop;
		enableZshIntegration = osConfig.programs.zsh.enable;

		extraConfig = ''
			return {
				warn_about_missing_glyphs = false,
				default_cursor_style = 'SteadyBlock',
				enable_tab_bar = false,
				window_background_opacity = 0.9,
				window_padding = {
					left = 0,
					right = 0,
					top = 0,
					bottom = 0,
				},
			}
		'';
	};

	programs.btop = {
		enable = true;
		settings.theme_background = false;
	};

}
