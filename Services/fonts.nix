{ pkgs, ... }:

{

	fonts.fontDir.enable = true;

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		inter
		corefonts
		atkinson-hyperlegible
	];

}
