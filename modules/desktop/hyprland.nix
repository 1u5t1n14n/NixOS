{ config, pkgs, ... }:

{

	programs.hyprland.enable = true;

	environment.systemPackages = lib.mkIf config.programs.hyprland.enable [
		pkgs.swww pkgs.waypaper
	];

}
