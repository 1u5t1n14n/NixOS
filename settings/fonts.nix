{ config, pkgs, ... }:

{

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inter
    corefonts
  ];

}