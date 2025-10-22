{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		vlc obs-studio gimp inkscape kdePackages.kdenlive
	];

}
