{ pkgs, ... }:

{

	fonts = {
		fontDir.enable = true;
		enableDefaultPackages = true;
		packages = with pkgs; [
			jost
			eb-garamond

			ibm-plex
			inter
			literate
			corefonts
			font-awesome

			nerd-fonts.blex-mono
			nerd-fonts.jetbrains-mono
		];
	};

}
