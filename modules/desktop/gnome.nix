{ lib, pkgs, config, host, ... }:

let
	cfg = config.services.desktopManager.gnome;

	mimeAppsList = pkgs.writeTextFile {
		name = "gnome-mimeapps";
		destination = "/share/applications/mimeapps.list";
		text = ''
			[Default Applications]
			inode/directory=nautilus.desktop;org.gnome.Nautilus.desktop
		'';
	};

in
{

	services = {
		displayManager.gdm = {
			enable = true;
			banner = "Non mortem timendum, sed quod numquam incipiat vivere.";
		};
		desktopManager.gnome.enable = true;

		gnome = {
			# Calendar Server
			evolution-data-server.enable = true;

			# Previewer for Nautilus
			sushi.enable = true;

			# Core Apps not installing by default
			core-apps.enable = false;
		};

		# Disable XTerm
		xserver.excludePackages = [ pkgs.xterm ];
	};

	programs = {
		kdeconnect = {
			enable = cfg.enable;
			package = pkgs.valent;
		};

		# Disable GNOME Console Integrations
		# Since it is no longer installed
		bash.vteIntegration = false;
		zsh.vteIntegration = false;

		nautilus-open-any-terminal = {
			enable = true;
			terminal = "wezterm";
		};

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
		]

		++ lib.optionals (!config.services.gnome.core-apps.enable) [
			baobab
			decibels
			epiphany
			gnome-text-editor
			gnome-calculator
			gnome-calendar
			gnome-characters
			gnome-contacts
			gnome-font-viewer
			gnome-maps
			loupe
			nautilus
		]

		# Nautilus Thumbnailer
		++ [ libheif libheif.out ]

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
			gnomeExtensions.gsconnect
			gnomeExtensions.valent
			valent
		];

		gnome.excludePackages = [ pkgs.gnome-tour ];

		sessionVariables = {
			# Nautilus
			NAUTILUS_4_EXTENSION_DIR = lib.mkIf cfg.enable "${config.system.path}/lib/nautilus/extensions-4";
			XDG_DATA_DIRS = lib.mkIf cfg.enable [ "${mimeAppsList}/share" ];

			# Hint Electron Apps to use Wayland
			NIXOS_OZONE_WL = "1";

			# Disables Decorations for Qt Apps
			QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
			QT_QPA_PLATFORMTHEME = "gtk2";
			QT_QPA_PLATFORM = "wayland";
		};

		# Nautilus
		pathsToLink = [
			"/share/nautilus-python/extensions"

			# Thumbnailers
			"share/thumbnailers"
		];
	};

	# GStreamer Plugins for Nautilus
	nixpkgs.overlays = [
		(final: prev: {
			nautilus = prev.nautilus.overrideAttrs (nprev: {
				buildInputs =
					nprev.buildInputs
					++ (with pkgs.gst_all_1; [
						gst-plugins-good
						gst-plugins-bad
					]);
			});
		})
	];

	# Automatic Screen Rotation
	hardware.sensor.iio.enable = true;

}
