{ pkgs, nixvim, ... }:

{

	environment.systemPackages = with pkgs; [
		(nixvim.legacyPackages.${pkgs.stdenv.hostPlatform.system}.makeNixvim {
			viAlias = true;
			vimAlias = true;
			globals.mapleader = " ";
			globals.localmapleader = ",";
		 	colorschemes.gruvbox.enable = true;
		 	plugins = {
				web-devicons.enable = true;
				lualine.enable = true;
				neo-tree.enable = true;
				telescope = {
					enable = true;
					keymaps = {
						"<C-p>" = {
							action = "git_files";
							options.desc = "Telescope Git Files";
						};
						"<leader><leader>" = "live_grep";
					};
				};
				vimtex = {
					enable = true;
					settings.compiler_method = "latexmk";
				};
				which-key.enable = true;
				alpha = {
					enable = true;
					theme = "dashboard";
				};
		 		treesitter = {
		 			enable = true;
		 			settings.auto_install = true;
		 		};
		 		lsp.enable = true;
		 			lsp.servers = {
		 			ltex.enable = true;
					clangd.enable = true;
		 		};
		 	};
		 })
	];

}
