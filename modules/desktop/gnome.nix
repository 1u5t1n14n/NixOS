{ lib, pkgs, config, host, ... }:

let
	cfg = config.services.desktopManager.gnome;

in
{

	# Automatic Login
	systemd = {
		services."autovt@tty1".enable = !config.services.displayManager.autoLogin.enable;
		services."getty@tty1".enable = !config.services.displayManager.autoLogin.enable;
	};

	security.pam.services.login.enableGnomeKeyring = cfg.enable;

	services = {
		desktopManager.gnome.enable = true;
		displayManager = {
			autoLogin = {
				enable = false;
				user = host.user;
			};
			gdm.enable = true;
		};

		gnome = {
			core-apps.enable = false;
			gnome-keyring.enable = cfg.enable;

			# Calendar Server
			evolution-data-server.enable = true;
		};

		# Disable XTerm
		xserver.excludePackages = [ pkgs.xterm ];
	};

	programs = {
		nautilus.enable = true;
		kdeconnect = lib.mkIf cfg.enable {
			enable = true;
			package = lib.mkForce pkgs.valent;
		};

		# Disable GNOME Console Integrations
		# Since it is no longer installed
		bash.vteIntegration = false;
		zsh.vteIntegration = false;

		seahorse.enable = true;
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

			# Looks cool
			ghostty
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

	qt.platformTheme = lib.mkIf cfg.enable "gnome";

	# Automatic Screen Rotation
	hardware.sensor.iio.enable = true;

}
