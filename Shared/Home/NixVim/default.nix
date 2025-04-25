{ inputs, ... }:

{

	imports = [ inputs.nixVim.homeManagerModules.nixvim ];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		colorschemes.catppuccin.enable = true;
		plugins = {
			lualine.enable = true;
			web-devicons.enable = true;
			telescope = {
				enable = true;
				keymaps = {
					"<leader><leader>" = {
						action = "live_grep";
						options.desc = "Live Grep";
					};
					"<C-p>" = {
						action = "find_files";
						options.desc = "Find Files";
					};
					"<leader>bb" = {
						action = "buffers";
						options.desc = "Buffers";
					};
				};
			};
		};
		globals = {
			mapleader = " ";
		};
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
		clipboard.providers.wl-copy.enable = true;
	};

}
