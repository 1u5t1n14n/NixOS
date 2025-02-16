{ pkgs, ... }:

{

	imports = [
		./tty.nix
		./firefox.nix
	];

	environment.systemPackages = with pkgs; [
		bat
		browsh
		btop
		cmake
		cmatrix
		fastfetch
		fd
		ffmpeg
		figlet
		fzf
		gcc
		gh
		git
		gnumake
		gnuplot
		imagemagick
		nodejs
		onefetch
		pandoc
		ripgrep
		superfile
		texliveFull
		tree
		tree-sitter
		typst
		unzip
		uwufetch
		wget
		yt-dlp
		zfxtop
		zip
		zsh
	];

	programs.dconf.enable = true;
	programs.zsh.enable = true;

}
