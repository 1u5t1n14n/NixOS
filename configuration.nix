{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./programs/pkgs.nix
    ./settings/nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-88e44070-b8d2-4c7d-b0b4-2853624aa580".device = "/dev/disk/by-uuid/88e44070-b8d2-4c7d-b0b4-2853624aa580";
  
  system.stateVersion = "24.05";

}
