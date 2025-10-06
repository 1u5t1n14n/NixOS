{ lib, pkgs, config, host, ... }:

let
	cfg = config.services.desktopManager.gnome;

in
{

	# Automatic Login
	systemd.services."getty@tty1".enable = !config.services.displayManager.autoLogin.enable;
	systemd.services."autovt@tty1".enable = !config.services.displayManager.autoLogin.enable;

	# Automatic Keyring Decryption
	security.pam.services.login.enableGnomeKeyring = config.services.displayManager.autoLogin.enable;

	services = {
		displayManager = {
			autoLogin = {
				enable = cfg.enable;
				user = host.user;
			};
			gdm.enable = true;
		};
		desktopManager.gnome.enable = true;

		gnome = {
			gnome-keyring.enable = cfg.enable;
			# Calendar Server
			evolution-data-server.enable = true;

			# Core Apps not installing by default
			core-apps.enable = false;
		};

		# Disable XTerm
		xserver.excludePackages = [ pkgs.xterm ];
	};

	programs = {
		nautilus.enable = true;
		kdeconnect = {
			enable = cfg.enable;
			package = pkgs.valent;
		};

		# Disable GNOME Console Integrations
		# Since it is no longer installed
		bash.vteIntegration = false;
		zsh.vteIntegration = false;

		evince.enable = true;
		file-roller.enable = true;
		gnome-disks.enable = true;
	};

	environment = {
		# Install some extra Applications
		systemPackages = with pkgs; [
			citations
			morewaita-icon-theme
			papers
			pdfarranger
			seahorse
		]

		++ lib.optionals (!config.services.gnome.core-apps.enable) [
			baobab
			decibels
			epiphany
			gnome-calculator
			gnome-calendar
			gnome-characters
			gnome-contacts
			gnome-font-viewer
			gnome-maps
			gnome-text-editor
			loupe
			showtime
			wordbook
		]

		++ lib.optionals config.services.displayManager.autoLogin.enable [ gcr ]

		# And GNOME Shell Extensions
		++ lib.optionals cfg.enable [
			gnomeExtensions.launch-new-instance
			gnomeExtensions.blur-my-shell
			gnomeExtensions.native-window-placement
			gnomeExtensions.just-perfection
			gnomeExtensions.dash-to-dock
			gnomeExtensions.media-controls
			gnomeExtensions.unite
			gnomeExtensions.hide-activities-button
			gnomeExtensions.valent

			valent
		];

		gnome.excludePackages = [ pkgs.gnome-tour ];

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
