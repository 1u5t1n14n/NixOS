{ lib, hasDesktop, ... }:

{

	imports =
		[
			./executable.nix
			./fonts.nix
			./locale.nix
			./networking.nix
			./printing.nix
			./user.nix
		]
		++ lib.optionals hasDesktop [
			./displaylink.nix
			./gsconnect.nix
			./searxng.nix
			./sound.nix
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
