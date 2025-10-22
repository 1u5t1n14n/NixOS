{ config, pkgs, ... }:

{

	programs.niri.enable = true;

	environment.systemPackages = with pkgs; [
		swww waybar niriswitcher
	];

}
