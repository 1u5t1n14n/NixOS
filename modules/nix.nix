{ host, ... }:

{

	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};

		gc = {
			automatic = true;
			dates = "daily";
			options = "--delete-older-than 3d";
		};
	};

	system = {
		autoUpgrade = {
			flake = "github:1u5t1n14n/NixOS\#${host.name}";
			enable = host.hasDesktop;
			upgrade = false;
		};

		stateVersion = "25.11";
	};

	nixpkgs.config = {
		allowBroken = true;
		allowUnfree = true;
	};

}
