{ config, pkgs, lib, ... }:

{

  programs.neovim = {
    enable = true;
    extraLuaConfig = lib.fileContents ../files/src/init.lua;
  };

}
