{ pkgs, config, ... }:

let
	cfg = config.services.desktopManager.gnome;

in
{

	services = {
		displayManager.gdm = {
			enable = true;
			banner = "Non mortem timendum, sed quod numquam incipiat vivere.";
		};
		desktopManager.gnome.enable = true;

		# Calendar Server
		gnome.evolution-data-server.enable = true;

		# Disable XTerm
		xserver.excludePackages = [ pkgs.xterm ];
	};

	programs = {
		# Enable GSConnect
		kdeconnect = {
			enable = cfg.enable;
			package = pkgs.gnomeExtensions.gsconnect;
		};

		nautilus-open-any-terminal = {
			enable = true;
			terminal = "wezterm";
		};

		# Disable GNOME Console Integrations
		# Since it is no longer installed
		bash.vteIntegration = false;
		zsh.vteIntegration = false;
	};

	environment = {
		# Install some extra Applications
		# And GNOME Shell Extensions
		systemPackages = with pkgs; [
			gnomeExtensions.launch-new-instance
			gnomeExtensions.blur-my-shell
			gnomeExtensions.native-window-placement
			gnomeExtensions.just-perfection
			gnomeExtensions.dash-to-dock
			gnomeExtensions.media-controls
			gnomeExtensions.unite
			gnomeExtensions.hide-activities-button

			citations
			impression
			morewaita-icon-theme
			papers
			pdfarranger
		]

		++ lib.optionals (config.programs.nautilus-open-any-terminal.terminal == "wezterm" ) [ wezterm ];

		# Exclude Packages that would be installed
		# For GNOME
		gnome.excludePackages = with pkgs; [
			# E-Mail Application
			geary
			gnome-clocks
			gnome-connections
			gnome-console
			gnome-font-viewer
			gnome-logs
			gnome-music
			gnome-system-monitor
			gnome-tour
			gnome-weather

			# Screen Reader
			orca
			seahorse

			# Camera Tool
			snapshot
			totem
			yelp
		];

		sessionVariables = {
			# Hint Electron Apps to use Wayland
			NIXOS_OZONE_WL = "1";

			# Disables Decorations for Qt Apps
			QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
			QT_QPA_PLATFORMTHEME = "gtk2";
			QT_QPA_PLATFORM = "wayland";
		};
	};

	# Automatic Screen Rotation
	hardware.sensor.iio.enable = true;

}
