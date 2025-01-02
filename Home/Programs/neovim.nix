{ pkgs, lib, ... }:

{

	programs.neovim = {
		enable = true;
		extraLuaConfig = lib.fileContents ../init.lua;
	};

}
