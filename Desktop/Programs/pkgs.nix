{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
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
