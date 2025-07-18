{ ... }:

{

	system.stateVersion = "25.11";

	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};

		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 30d";
		};
	};

	nixpkgs.config = {
		allowBroken = true;
		allowUnfree = true;
	};

}
