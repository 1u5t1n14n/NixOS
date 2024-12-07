{ config, pkgs, ... }:

{

	imports = [
		./code.nix
		./firefox.nix
		./gnome.nix
		./hyprland.nix
		./localsend.nix
		./neovim.nix
		./steam.nix
		./tmux.nix
		./wezterm.nix
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
