{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		imagemagick
		yt-dlp
		pandoc
		ffmpeg
		btop
		cmake
		fd
		gcc
		gnumake
		gnuplot
		nodejs
		ripgrep
		texliveFull
		tree-sitter
		unzip
		zip
		tree
		typst
	];

	programs.dconf.enable = true;

}
