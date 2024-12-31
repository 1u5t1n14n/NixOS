{ pkgs, ... }:

{

	programs.zsh.enable = true;

	environment.systemPackages = with pkgs; [
		aerc
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
