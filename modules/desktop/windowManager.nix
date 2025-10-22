{ config, pkgs, lib, ... }:

{

	programs = {
		hyprland.enable = false;
		niri.enable = true;
	};

	environment.systemPackages = with pkgs; [
		swww waypapaer waybar niriswitcher
	];

}
