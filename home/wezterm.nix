{ osConfig, ... }:

{

	programs.wezterm = {
		enable = true;
		enableZshIntegration = osConfig.programs.zsh.enable;
		extraConfig = ''
			return {
				hide_tab_bar_if_only_one_tab = true,
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

}
