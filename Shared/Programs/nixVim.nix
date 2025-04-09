{ nixVim, pkgs, ... }:

{

	environment.systemPackages = [
		(nixVim.legacyPackages."${pkgs.stdenv.hostPlatform.system}".makeNixvim {
		 	config.colorschemes.gruvbox.enable = true;
			options = {
				number = true;
				relativenumber = true;
				shiftwidth = 4;
			};
		 })
	];

}
