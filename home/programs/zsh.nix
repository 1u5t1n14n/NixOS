{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      spf = "superfile";
      "sudo pacman -Syu" = "sudo nixos-rebuild switch --flake /home/1u5t1n14n/Repositories/NixOS#Morpheus";
    };
  };

}
