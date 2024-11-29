{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wl-clipboard
    git
    lazygit
    cmatrix
    alacritty
    wget
    bat
    fastfetch
    browsh
    figlet
    zfxtop
  ];

}
