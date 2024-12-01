{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./neovim.nix
    ./git.nix
    ./zsh.nix
    ./zathura.nix
    ./hyprland.nix
    ./firefox.nix
    ./github.nix
    ./wezterm.nix
    ./superfile.nix
  ];

  home.packages = with pkgs; [
  ];

}
