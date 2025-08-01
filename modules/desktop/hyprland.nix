{ config, pkgs, lib, ... }:

{

	programs.hyprland.enable = true;

	environment.systemPackages = lib.mkIf config.programs.hyprland.enable [
		pkgs.swww pkgs.waypaper
	];

}
