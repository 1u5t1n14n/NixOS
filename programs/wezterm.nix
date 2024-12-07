{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		bat
		browsh
		cmatrix
		fastfetch
		figlet
		fzf
		gh
		git
		lazygit
		onefetch
		uwufetch
		wezterm
		wget
		wl-clipboard
		zfxtop
		zsh
	];

}
