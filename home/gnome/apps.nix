{ lib, host, ... }:

{

	dconf.settings = {
		"org/gnome/nautilus/preferences" = {
			show-create-link = true;
			show-delete-permanently = true;
			date-time-format = "detailed";
		};
		"org/gnome/shell" = {
			favorite-apps = lib.optionals (host.terminal == "wezterm") [
				"org.wezfurlong.wezterm.desktop"
			]

			++ [
				"firefox.desktop"
				"org.gnome.Nautilus.desktop"
				"thunderbird.desktop"
				"org.prismlauncher.PrismLauncher.desktop"
				"steam.desktop"
				"startcenter.desktop"
			];
		};
	};

}
