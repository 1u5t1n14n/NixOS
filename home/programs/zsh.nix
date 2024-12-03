{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      spf = "superfile";
      f = "vi $(fzf)";
    };
  };

}
