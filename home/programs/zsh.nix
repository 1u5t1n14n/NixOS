{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

}
