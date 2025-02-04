{ inputs, ... }:

{

	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};
	};

	nixpkgs.config.allowBroken = true;
	nixpkgs.config.allowUnfree = true;

	nixpkgs.overlays = [ inputs.nur.overlay ];

	system.stateVersion = "25.05";

}
