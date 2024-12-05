{ config, pkgs, ... }:

{

  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "Office" ];
    };
    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "cups.desktop" "nvim.desktop" "rofi.desktop" "rofi-theme-selector.desktop" "nixos-manual.desktop" "arandr.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };
    "org/gnome/desktop/app-folders/folders/Office" = {
      apps = [ "calc.desktop" "writer.desktop" "math.desktop" "base.desktop" "draw.desktop" "impress.desktop" "onlyoffice-desktopeditors.desktop" "startcenter.desktop" ];
      name = "Office";
    };
  };

  home.file."Repositories/.keep".text = "";
  home.file."Pictures/Wallpapers/.keep".text = "";

  home.file."Templates/index.html".text = ''
<!DOCTYPE html>
<html>
<head>
<title>Title</title>
</head>
<body>

</body>
</html>
  '';

}
