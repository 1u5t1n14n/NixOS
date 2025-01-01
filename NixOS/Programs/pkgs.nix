{ pkgs, lib, hasDesktop, ... }:

{

	imports =
		[
			./neovim.nix
			./tmux.nix
			./tty.nix
		]
		++ lib.optionals hasDesktop [
			./code.nix
			./firefox.nix
			./gnome.nix
			./hyprland.nix
			./localsend.nix
			./steam.nix
			./wezterm.nix
		]
		++ lib.optionals (!hasDesktop) [
			./graphical.nix
		];

	environment.systemPackages = with pkgs; [
		home-manager
	];

}
