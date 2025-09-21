{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [

		# Calibre
		calibre

		# Reading Texts
		kiwix
	];

}
