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
    ./alacritty.nix
    ./steam.nix
    ./code.nix
	];

	environment.systemPackages = with pkgs; [
		home-manager
    gimp
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
