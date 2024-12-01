{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs.gnomeExtensions; [
    gsconnect
    dock-from-dash
    just-perfection
    custom-hot-corners-extended
    blur-my-shell
    unite
    transparent-window-moving
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  networking.firewall.allowedTCPPortRanges = [
    { from = 1714; to = 1764; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 1714; to = 1764; }
  ];

}
