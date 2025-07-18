{ pkgs, ... }:

{

	fonts = {
		fontDir.enable = true;
		packages = with pkgs; [
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
