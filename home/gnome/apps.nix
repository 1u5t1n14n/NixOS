{ lib, host, ... }:

{

	dconf.settings = {
		"org/gnome/nautilus/preferences" = {
			show-create-link = true;
			show-delete-permanently = true;
			date-time-format = "detailed";
		};
		"org/gnome/shell" = {
			favorite-apps = [
				"org.wezfurlong.wezterm.desktop"
				"firefox.desktop"
				"org.gnome.Nautilus.desktop"
				"thunderbird.desktop"
				"org.prismlauncher.PrismLauncher.desktop"
				"steam.desktop"
				"startcenter.desktop"
			];
		};

		# Enable Papers Night-Mode
		"org/gnome/papers".night-mode = false;
	};

}
