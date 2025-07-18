{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		libreoffice-fresh

		# Dictionaries
		hunspell
		hunspellDicts.de_DE
		hunspellDicts.en_GB-ize
	];

	# Needed for LibreOffice Base
	programs.java.enable = true;

}
