{ config, pkgs, ... }:

{

  imports = [
    ./locale.nix
    ./linkwarden.nix
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

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

}
