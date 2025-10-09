{ host, ... }:

{

	imports = [
		./settings.nix
		./search.nix
		./style.nix
		./bookmarks.nix
	];

	programs.firefox = {
		enable = host.hasDesktop;
		profiles.default = {
			isDefault = true;
			name = "default";
			id = 0;
		};
	};

}
