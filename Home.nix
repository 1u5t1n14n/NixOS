{ config, pkgs, userName, ... }:

{

	imports = [
		./Shared/Home/Home.nix
	];

	home = {
		username = "${userName}";
		homeDirectory = "/home/${config.home.username}";
		stateVersion = "25.05";
		packages = with pkgs; [ ];
	};

	programs.home-manager.enable = true;

}
