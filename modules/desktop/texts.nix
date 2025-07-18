{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [

		# Calibre
		(calibre.override {
			unrarSupport = true;
		})

		# Reading Texts
		kiwix
	];

}
