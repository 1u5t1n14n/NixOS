{ pkgs, ... }:

{

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};

	environment.variables = {
		EDITOR = "nvim";
		VISUAL = "bat";
		SUDO_EDITOR = "nvim";
	};

	environment.systemPackages = with pkgs; [
		cmake
		fd
		gcc
		gnumake
		gnuplot
		nodejs
		ripgrep
		texliveFull
		tree-sitter
		unzip
		zip
	];

	programs.java = {
		enable = true;
		package = pkgs.jdk;
	};

}
