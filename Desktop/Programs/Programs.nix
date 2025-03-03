{ pkgs, ... }:

{

	imports = [
		./Firefox
		./code.nix
		./games.nix
		./gnome.nix
	];

	environment.systemPackages = with pkgs; [
		geogebra
		wezterm
		wl-clipboard
		onlyoffice-bin
		obsidian
		libreoffice-fresh
		thunderbird
		pdfarranger
		vlc
	];

}
