{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wezterm
    wl-clipboard
    git
    onefetch
    uwufetch
    lazygit
    cmatrix
    wget
    bat
    fastfetch
    browsh
    figlet
    zfxtop
  ];

}
