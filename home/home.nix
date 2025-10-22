{ osConfig, host, pkgs, lib, ... }:

{

	imports = [
		./firefox
		./git.nix
		./gnome
		./gtk.nix
		./hypr
		./niri
		./nixvim
		./vicinae.nix
		./wezterm.nix
		./zed.nix
	];

	home = {
		username = host.user;
		homeDirectory = osConfig.users.users.${host.user}.home;
		stateVersion = "25.11";
		packages = with pkgs; [ ];
	};

	programs.home-manager.enable = true;

}
