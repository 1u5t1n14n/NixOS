{ host, ... }:

{

	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
			download-buffer-size = 1024 * 1024 * 1024;
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
			enable = true;
			allowReboot = !host.hasDesktop;
			upgrade = host.hasDesktop;
		};

		stateVersion = "25.11";
	};

	nixpkgs.config = {
		allowBroken = true;
		allowUnfree = true;
	};

}
