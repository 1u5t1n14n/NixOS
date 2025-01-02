{ config, pkgs, userName, lib, hasDesktop, ... }:

{

	imports =
		[
			./Programs/pkgs.nix
		]
		++ lib.optionals hasDesktop [
			./Services/directories.nix
		];

	home.username = "${userName}";
	home.homeDirectory = "/home/${config.home.username}";

	programs.home-manager.enable = true;

	home.stateVersion = "24.05";

}
