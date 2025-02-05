{ ... }:

{

	dconf.settings = {
		"org/gnome/epiphany" = {
			ask-for-default = false;
		};
		"io/github/mrvladus/List" = {
			launch-on-startup = false;
			maximized = false;
			run-in-background = false;
		};
		"org/gnome/tweaks" = {
			show-extensions-notice = false;
		};
		"org/gnome/desktop/app-folders" = {
			folder-children = [
				"Utilities"
				"Office"
				"Documents"
			];
		};
		"org/gnome/desktop/app-folders/folders/Documents".name = "Documents";
		"org/gnome/desktop/app-folders/folders/Documents".apps = [
			"org.gnome.Papers.desktop"
			"org.gnome.Evince.desktop"
			"com.github.johnfactotum.Foliate.desktop"
			"io.github.diegoivan.pdf_metadata_editor.desktop"
			"com.github.jeromerobert.pdfarranger.desktop"
			"org.gnome.World.Citations.desktop"
		];
		"org/gnome/desktop/app-folders/folders/Office".name = "Office";
		"org/gnome/desktop/app-folders/folders/Office".apps = [
			"calc.desktop"
			"draw.desktop"
			"impress.desktop"
			"math.desktop"
			"writer.desktop"
			"base.desktop"
			"startcenter.desktop"
			"onlyoffice-desktopeditors.desktop"
		];
		"org/gnome/desktop/app-folders/folders/Utilities".apps = [
			"arandr.desktop"
			"cups.desktop"
			"ca.desrt.dconf-editor.desktop"
			"rofi.desktop"
			"rofi-theme-selector.desktop"
			"nixos-manual.desktop"
			"btop.desktop"
			"nvim.desktop"
			"greenfoot.desktop"
		];
		"org/gnome/shell" = {
			favorite-apps = [
				"org.wezfurlong.wezterm.desktop"
				"firefox.desktop"
				"org.gnome.Nautilus.desktop"
				"minecraft-launcher.desktop"
				"discord.desktop"
				"steam.desktop"
				"jetbrains-toolbox.desktop"
				"io.github.mrvladus.List.desktop"
				"org.gnome.World.Secrets.desktop"
			];
		};
	};

}
