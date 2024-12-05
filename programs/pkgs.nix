{ config, pkgs, ... }:

{

	imports = [
    ./localsend.nix
    ./firefox.nix
    ./zsh.nix
    ./hyprland.nix
    ./gnome.nix
    ./neovim.nix
    ./tmux.nix
    ./wezterm.nix
    ./steam.nix
    ./code.nix
	];

	environment.systemPackages = with pkgs; [
		home-manager
    gimp
    pdfarranger
    minecraft
    geogebra6
		obsidian
		onlyoffice-bin
    libreoffice-fresh
		inkscape-with-extensions
		texliveFull
		vlc
  ];

}
