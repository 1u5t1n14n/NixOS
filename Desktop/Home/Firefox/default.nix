{ ... }:

{

	imports = [
		./extensions.nix
		./search.nix
	];

	programs.firefox.enable = true;
	programs.firefox.languagePacks = [ "*" ];
	programs.firefox.profiles.Firefox = {
		name = "Firefox";
		isDefault = true;
		id = 0;
	};

}
