{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		jetbrains-toolbox
		greenfoot
	];

}
