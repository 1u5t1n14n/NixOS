{ pkgs, ... }:

{

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		inter
		corefonts
		atkinson-hyperlegible
	];

}