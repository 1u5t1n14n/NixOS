{ osConfig, host, pkgs, lib, ... }:

{

	imports = [
		./firefox
		./gnome
		./git.nix
		./gtk.nix
		./nixVim.nix
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
