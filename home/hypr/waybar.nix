{ osConfig, ... }:

{

	programs.waybar.enable = osConfig.programs.waybar.enable;

	programs.waybar.settings.main = {
		modules-right = [ "clock" ];
	};

}
