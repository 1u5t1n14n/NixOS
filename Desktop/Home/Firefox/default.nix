{ ... }:

{

	imports = [
		./extensions.nix
		./search.nix
	];

	programs.firefox.enable = true;
	programs.firefox.profiles.enlightedFox = {
		name = "Enlighted Fox";
		isDefault = true;
		id = 0;
	};

}
