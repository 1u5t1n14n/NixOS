{ pkgs, ... }:

{

	fonts = {
		fontDir.enable = true;
		enableDefaultPackages = true;
		packages = with pkgs; [
			# Free (?)
			jost
			eb-garamond
			inter

			# Rendering
			noto-fonts
			unifont
			ibm-plex 
			# Unfree ~v
			symbola
			corefonts
			ibm-plex

			# Nerd Fonts
			nerd-fonts.blex-mono
			nerd-fonts.jetbrains-mono
		];
	};

}
