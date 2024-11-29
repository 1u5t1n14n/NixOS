{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.clion
    greenfoot
  ];

}
