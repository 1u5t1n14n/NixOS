{ ... }:

{

	imports = [
		./settings.nix
	];

	programs.firefox = {
		enable = true;
		profiles.Firefox = {
			isDefault = true;
			name = "Firefox";
			id = 0;
		};
	};

}
