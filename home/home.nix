{ config, pkgs, ... }:

{
	imports = [
		./programs/pkgs.nix
		./settings/directories.nix
	];

	home.username = "1u5t1n14n";
	home.homeDirectory = "/home/${config.home.username}";

	programs.home-manager.enable = true;

	home.stateVersion = "24.05";

}
