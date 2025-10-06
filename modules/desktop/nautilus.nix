{ lib, config, pkgs, ... }:

let
	cfg = config.programs.nautilus;

in
{

	options.programs.nautilus = {
		enable = lib.mkEnableOption "Enable the Nautilus File Manager.";
	};

	config = lib.mkIf cfg.enable {
		programs.nautilus-open-any-terminal = {
			enable = true;
			terminal = "wezterm";
		};

		services = {
			gnome.sushi.enable = true;
			gvfs.enable = true;
		};

		environment = {
			sessionVariables.NAUTILUS_4_EXTENSION_DIR = lib.mkIf config.services.desktopManager.gnome.enable "${config.system.path}/lib/nautilus/extensions-4";

			systemPackages = with pkgs; [
				# Important
				nautilus

				gnome-epub-thumbnailer
				gnome-font-viewer
				ffmpegthumbnailer

				libheif
				libheif.out 
			];

			pathsToLink = [
				"/share/nautilus-python/extensions"
				"share/thumbnailers"
			];
		};

		nixpkgs.overlays = [(final: prev: {
			nautilus = prev.nautilus.overrideAttrs (nprev: {
				buildInputs =
					nprev.buildInputs
					++ (with pkgs.gst_all_1; [
						gst-plugins-good
						gst-plugins-ugly
						gst-plugins-bad
					]);
			});
		})];
	};

}
