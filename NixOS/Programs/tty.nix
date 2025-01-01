{ pkgs, ... }:

{

	programs.zsh.enable = true;

	environment.systemPackages = with pkgs; [
		bat
		cmatrix
		fastfetch
		figlet
		fzf
		gh
		git
		onefetch
		uwufetch
		wezterm
		wget
		wl-clipboard
		zfxtop
		zsh
	];

}
