{ config, pkgs, ... }:

{

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/applications/terminal" = {
        exec = "alacritty";
        exec-arg = "-e";
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file:///home/1u5t1n14n/Pictures/Wallpapers/MacOS.png";
        picture-uri = "file:///home/1u5t1n14n/Pictures/Wallpapers/MacOS-Light.jpg";
      };
      "org/gnome/tweaks" = {
        show-extensions-notice = false;
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        icon-theme = "MoreWaita";
        locate-pointer = true;
        clock-show-date = false;
      };
      "org/gnome/desktop/sound" = {
        event-sounds = false;
      };
      "org/gnome/gnome-session" = {
        logout-prompt = false;
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-battery-timeout = 2700;
        sleep-inactive-ac-timeout = 0;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "unite@hardpixel.eu"
          "dock-from-dash@fthx"
          "blur-my-shell@aunetx"
          "transparent-window-moving@noobsai.github.com"
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
          "gsconnect@andyholmes.github.io"
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
          "just-perfection-desktop@just-perfection"
        ];
        favorite-apps = [
          "org.wezfurlong.wezterm.desktop"
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "obsidian.desktop"
          "minecraft-launcher.desktop"
          "discord.desktop"
          "steam.desktop"
          "jetbrains-toolbox.desktop"
          "org.inkscape.Inkscape.desktop"
        ];
      };
      "org/gnome/shell/extensions/unite" = {
        hide-window-titlebars = "always";
        show-window-buttons = "never";
        show-window-title = "never";
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
        dash-separator = true;
        activities-button = false;
      };
      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "mouse";
        auto-raise = false;
        audible-bell = false;
        mouse-button-modifier = "<Alt>";
        resize-with-right-button = true;
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        workspaces-only-primary = false;
        center-new-windows = false;
      };
      "org/gnome/desktop/privacy" = {
        remove-old-temp-files = true;
        remove-old-trash-files = true;
        disable-camera = true;
        remember-app-usage = false;
      };

      "org/gnome/desktop/wm/keybindings" = {
        toggle-maximized = ["<Alt>s"];
        toggle-fullscreen = ["F11"];
        activate-window-menu = ["<Alt>comma"];
        close = ["<Alt>q"];
        minimize = ["<Alt>minus"];
        always-on-top = ["<Alt><Shift>p"];
        switch-to-workspace-right = ["<Super>l"];
        switch-to-workspace-left = ["<Super>h"];
        move-to-workspace-left = ["<Super><Shift>h"];
        move-to-workspace-right = ["<Super><Shift>l"];
        move-to-side-e = ["<Alt><Shift>l"];
        move-to-side-n = ["<Alt><Shift>k"];
        move-to-side-s = ["<Alt><Shift>j"];
        move-to-side-w = ["<Alt><Shift>h"];
        move-to-center = ["<Alt>c"];
        show-desktop = ["<Super>F3"];
      };
      "org/gnome/shell/keybindings" = {
        shift-overview-down = ["<Super>Down"];
        shift-overview-up = ["<Super>Up"];
        toggle-quick-settings = ["<Super>comma"];
        toggle-application-view = ["<Alt>space"];
        toggle-message-tray = ["<Super>n"];
        open-new-window-application-1 = ["<Alt>1"];
        open-new-window-application-2 = ["<Alt>2"];
        open-new-window-application-3 = ["<Alt>3"];
        open-new-window-application-4 = ["<Alt>4"];
        open-new-window-application-5 = ["<Alt>5"];
        open-new-window-application-6 = ["<Alt>6"];
        open-new-window-application-7 = ["<Alt>7"];
        open-new-window-application-8 = ["<Alt>8"];
        open-new-window-application-9 = ["<Alt>9"];
        switch-to-application-1 = ["<Alt><Shift>1"];
        switch-to-application-2 = ["<Alt><Shift>2"];
        switch-to-application-3 = ["<Alt><Shift>3"];
        switch-to-application-4 = ["<Alt><Shift>4"];
        switch-to-application-5 = ["<Alt><Shift>5"];
        switch-to-application-6 = ["<Alt><Shift>6"];
        switch-to-application-7 = ["<Alt><Shift>7"];
        switch-to-application-8 = ["<Alt><Shift>8"];
        switch-to-application-9 = ["<Alt><Shift>9"];
      };
    };
  };

  home.file.".config/gtk-3.0/bookmarks".text = ''
file:///home/1u5t1n14n/Documents
file:///home/1u5t1n14n/Repositories
file:///home/1u5t1n14n/Repositories/NixOS
file:///home/1u5t1n14n/Pictures
file:///home/1u5t1n14n/Downloads
  '';

}
