{ config, pkgs, lib, ... }:

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

	home.file."Templates/file.hidden".text = ''
.git
*.aux
*.bcf-SAVE-ERROR
*.fdb_latexmk
*.fls
*.lof
*.log
*.out
*.toc
*.xdv
	'';

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

	home.file."Templates/main.tex".text = ''
\documentclass{article}

\usepackage{darkmode}
\enabledarkmode

\usepackage{amsmath}
\usepackage{fullpage}
\usepackage{float}

\usepackage[ngerman]{babel}

\title{}
\author{}
\date{\today}


\begin{document}

\end{document}
	'';

	home.activation = {
		wallpaperDownload = lib.hm.dag.entryAfter ["writeBoundary"] ''
			mkdir -p $HOME/Pictures/Wallpapers
			mkdir -p $HOME/Repositories/NixOS
			cd $HOME/Pictures/Wallpapers
			${pkgs.wget}/bin/wget https://images.alphacoders.com/134/1347517.png -O Wallpaper.png
			${pkgs.wget}/bin/wget https://images7.alphacoders.com/134/1345733.png -O WallpaperDark.png
		'';
	};

}
