{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wl-clipboard
    git
    onefetch
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
