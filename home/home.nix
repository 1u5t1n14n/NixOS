{ config, pkgs, lib, ... }:

{
	imports = [
    ./programs/pkgs.nix
    ./settings/directories.nix
	];

	home.username = "1u5t1n14n";
	home.homeDirectory = "/home/1u5t1n14n";

	programs.home-manager.enable = true;

	home.stateVersion = "24.05";

}
