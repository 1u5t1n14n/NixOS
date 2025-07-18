{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		inkscape geogebra6 obsidian zed-editor
		jetbrains.clion xorg.xprop
	];

}
