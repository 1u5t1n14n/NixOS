{ config, pkgs, ... }:

{

  # doesnt work as intended
  #xdg.mime.defaultApplications = {
  #  "inode/directory" = "org.gnome.Nautilus.desktop";
  #  "application/x-gnome-saved-search" = "org.gnome.Nautilus.desktop";
  #};

  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
  };

  services.libinput.enable = true;

  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.accounts-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-disk-utility
    gnome-music
    nixos-render-docs
    yelp
    totem
    geary
    baobab
    cheese
    gnome-text-editor
    gnome-clocks
    gnome-logs
    gnome-system-monitor
    gnome-weather
    gnome-connections
    simple-scan
    file-roller
    gnome-console
    seahorse
  ];

  environment.systemPackages = with pkgs; [
    gnome-frog
    wike
    dialect
    tangram
    memorado
    mousam
    impression
    gnome-tweaks
    papers
    dconf-editor
    morewaita-icon-theme
    wordbook
    errands
  ];

}
