{ pkgs, ... }:

{

	programs.zsh.enable = true;

	environment.systemPackages = with pkgs; [
		bat
		neovim
		cmatrix
		fastfetch
		figlet
		superfile
		fzf
		gh
		git
		onefetch
		uwufetch
		wget
		zfxtop
		zsh
	];

}
