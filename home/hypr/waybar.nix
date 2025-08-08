{ osConfig, ... }:

{

	programs.waybar.enable = osConfig.programs.hyprland.enable && true;

	programs.waybar.settings.main = {
		modules-right = [ "clock" ];
	};

}
