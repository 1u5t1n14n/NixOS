{ osConfig, pkgs, lib, ... }:

{

	programs.rofi = {
		enable = osConfig.programs.hyprland.enable && false;

		modes = [
			"drun"
			"ssh"
			"keys"
			"window"
			"recursivebrowser"
		];
	};

}
