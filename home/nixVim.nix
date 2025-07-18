{ inputs, ... }:

{

	programs.nixvim = {
		enable = true;

		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		colorschemes.catppuccin.enable = true;
		plugins = {
			lualine.enable = true;

			# Telescope
			web-devicons.enable = true;
			telescope = {
				enable = true;
				extensions.ui-select.enable = true;
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

			# Treesitter
			treesitter = {
				enable = true;
				settings = {
					ensureInstalled = [ "javascript" "nix" "c" "bash" "html" "markdown" "lua" ];
					highlight = {
						enable = true;
						additional_vim_regex_highlighting = true;
					};
					indent.enable = true;
				};
			};
		};
		autoGroups."kickstart-lsp-attach".clear = true;

		# Options
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
