{ config, pkgs, lib, ... }:

{

	programs = {
		hyprland.enable = false;
		niri.enable = true;
	};

	environment.systemPackages = [
		pkgs.swww pkgs.waypaper pkgs.waybar

		# Default for Niri
		pkgs.alacritty
	];

}
