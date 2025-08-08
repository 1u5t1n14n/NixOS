{ config, osConfig, ... }:

{

	programs.ags.enable = !config.programs.waybar.enable && osConfig.programs.hyprland.enable;

}
