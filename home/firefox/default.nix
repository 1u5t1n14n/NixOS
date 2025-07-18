{ ... }:

{

	imports = [
		./settings.nix
		./search.nix
		./style.nix
	];

	programs.firefox = {
		enable = true;
		profiles.default = {
			isDefault = true;
			name = "Firefox";
			id = 0;
		};
	};

}
