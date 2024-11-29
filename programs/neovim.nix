{ config, pkgs, ... }:

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
    gnumake
		gcc
		tree-sitter
		nodejs
		zip
		unzip
    fd
    ripgrep
	];

  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };

}
