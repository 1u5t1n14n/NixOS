{ config, pkgs, ... }:

{

	programs = {
		niri.enable = true;

		waybar.enable = true;
	};

	environment.systemPackages = with pkgs; [
		swww niriswitcher
	];

}
