{ pkgs, ... }:

{

	imports = [
		./firefox.nix
		./code.nix
		./games.nix
		./gnome.nix
	];

	environment.systemPackages = with pkgs; [
		firefox
		geogebra6
		wezterm
		wl-clipboard
		onlyoffice-bin
		obsidian
		libreoffice-fresh
		thunderbird
		vlc
	];

}
