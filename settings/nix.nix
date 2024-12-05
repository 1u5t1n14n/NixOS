{ config, pkgs, ... }:

{

  imports = [
    ./locale.nix
    ./user.nix
    ./networking.nix
    ./sound.nix
    ./displaylink.nix
    ./printing.nix
    ./gsconnect.nix
    ./executable.nix
    ./searxng.nix
    ./fonts.nix
  ];

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
