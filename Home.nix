{ userName, pkgs, ... }:

{

	imports = [
		./Desktop/Home/Home.nix
		./Shared/Home/Home.nix
		./Server/Home/Home.nix
	];


	home.username = "${userName}";
	home.homeDirectory = "/home/${userName}";

	home.packages = with pkgs; [ ];

	programs.home-manager.enable = true;

	home.stateVersion = "25.05";

}
