{ lib, ... }:

{

	programs.nixvim = {
		globals.mapleader = " ";

		plugins = {
			telescope.keymaps = lib.mkIf config.programs.nixvim.plugins.telescope.enable {
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

}
