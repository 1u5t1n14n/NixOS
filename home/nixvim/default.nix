{ inputs, ... }:

{

	imports = [
		./plugins.nix
		./keyMap.nix
	];

	programs.nixvim = {
		enable = true;

		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		colorschemes.catppuccin.enable = true;
		autoGroups."kickstart-lsp-attach".clear = true;

		# Options
		opts = {
			number = true;
			relativenumber = true;
			scrolloff = 8;

			tabstop = 4;
			softtabstop = 4;
			shiftwidth = 4;

			smartindent = true;
			swapfile = false;
			spell = false;
			foldenable = false;
			guicursor = "";
		};
		clipboard.providers.wl-copy.enable = true;
	};

}
