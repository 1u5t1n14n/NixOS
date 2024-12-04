{ config, pkgs, ... }:

{

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
    gnome-connections
    gnome-disk-utility
    gnome.cheese
    gnome-music
    nixos-render-docs
    yelp
    totem
    geary
    baobab
    gnome-text-editor
    #gnome-clocks
    gnome-logs
    gnome-system-monitor
    gnome-weather
    simple-scan
    #file-roller
    gnome-console
    seahorse
  ];

  environment.systemPackages = with pkgs; [
    gnome-remote-desktop
    gnome-frog
    wike
    dialect
    tangram
    memorado
    mousam
    impression
    gnome-tweaks
    textpieces
    mousai
    papers
    dconf-editor
    morewaita-icon-theme
    wordbook
    errands
    switcheroo
    key-rack
    morphosis
    rnote
    gnome-secrets
    snoop
    citations
  ];

}
