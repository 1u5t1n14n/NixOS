{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		browsh
		btop
		cmake
		fd
		ffmpeg
		gcc
		gnumake
		gnuplot
		imagemagick
		nodejs
		pandoc
		ripgrep
		texliveFull
		tree
		tree-sitter
		typst
		unzip
		yt-dlp
		zip
	];

	programs.dconf.enable = true;

}
