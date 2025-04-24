{ inputs, ... }:

{

	imports = [ inputs.nixVim.homeManagerModules.nixvim
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		colorschemes.catppuccin.enable = true;
		plugins.lualine.enable = true;

		clipboard.providers.wl-copy.enable = true;
		opts = {
			number = true;
			relativenumber = true;

			tabstop = 4;
			softtabstop = 4;

			smartindent = true;
			shiftwidth = 4;

			scrolloff = 8;

			swapfile = false;
			spell = false;
			foldenable = false;
		};
	};

}
