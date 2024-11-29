{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.writerside
    jetbrains.clion
    greenfoot
  ];

}
