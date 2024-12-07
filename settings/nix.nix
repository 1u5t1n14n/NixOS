{ config, pkgs, ... }:

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

	system.activationScripts = {
		wallpaperDownload.text = ''
			cd /home/1u5t1n14n/Pictures/Wallpapers/
			${pkgs.wget}/bin/wget https://images.alphacoders.com/134/1347517.png -O Wallpaper.png
			${pkgs.wget}/bin/wget https://images7.alphacoders.com/134/1345733.png -O WallpaperDark.png
		'';
	};

	nixpkgs.config.allowBroken = true;
	nixpkgs.config.allowUnfree = true;

}
