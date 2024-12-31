{ ... }:

{

	imports = [
		./displaylink.nix
		./executable.nix
		./fonts.nix
		./gsconnect.nix
		./locale.nix
		./networking.nix
		./printing.nix
		./searxng.nix
		./sound.nix
		./user.nix
	];

	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};
		gc = {
			automatic = true;
			dates = "03:15";
			options = "--delete-older-than 2d";
		};
	};

	nixpkgs.config.allowBroken = true;
	nixpkgs.config.allowUnfree = true;

}
