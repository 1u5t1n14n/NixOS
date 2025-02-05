{ ... }:

{

	imports = [
		./extensions.nix
		./search.nix
	];

	programs.firefox.enable = true;
	programs.firefox.profiles.risingFox = {
		name = "Rising Fox";
		isDefault = true;
		id = 0;
	};

}
