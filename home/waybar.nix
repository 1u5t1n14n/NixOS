{ osConfig, ... }:

{

	programs.waybar = {
		enable = osConfig.programs.waybar.enable;
		style = ''
			* {
				font-family: Inter;
			}
		'';
	};

}
