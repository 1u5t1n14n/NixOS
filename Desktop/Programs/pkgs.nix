{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		syncthing
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
