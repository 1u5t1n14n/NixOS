{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		libreoffice-fresh

		# Dictionaries
		hunspell
		hunspellDicts.de_DE
		hunspellDicts.en_GB-ize

		# Adding when running out of Words.
		# hunspellDicts.en_GB-large

		hunspellDicts.fr-any
		hunspellDicts.es_ES
	];

	# Needed for LibreOffice Base
	programs.java.enable = true;

}
