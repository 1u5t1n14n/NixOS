{ pkgs, lib, hasDesktop, ... }:

{

	imports =
		[
			./git.nix
			./neovim.nix
			./superfile.nix
			./zsh.nix
		]
		++ lib.optionals hasDesktop [
			./firefox.nix
			./gnome.nix
			./hyprland.nix
			./wezterm.nix
		];

	home.packages = with pkgs; [ ];

}
