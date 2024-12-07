{ config, pkgs, ... }:

{
	imports = [
		./firefox.nix
		./git.nix
		./github.nix
		./gnome.nix
		./hyprland.nix
		./neovim.nix
		./superfile.nix
		./wezterm.nix
		./zathura.nix
		./zsh.nix
	];

	home.packages = with pkgs; [ ];

}
