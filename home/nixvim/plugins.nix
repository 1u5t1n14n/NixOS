{ config, ... }:

{

	programs.nixvim.plugins = {
		hardtime.enable = false;
		lualine.enable = true;

		web-devicons.enable = config.programs.nixvim.plugins.telescope.enable;
		telescope = {
			enable = true;
			extensions.ui-select.enable = true;
		};

		# Treesitter
		treesitter = {
			enable = true;
			settings = {
				ensureInstalled = [ "nix" "c" "bash" "html" "markdown" "lua" ];
				indent.enable = true;
				highlight = {
					enable = true;
					additional_vim_regex_highlighting = true;
				};
			};
		};
	};


}
