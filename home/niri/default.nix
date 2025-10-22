{ osConfig, config, ... }:

{

	imports = [
		./binds.nix
	];

	programs.niri = {
		enable = osConfig.programs.niri.enable;
		settings = {
			input = {
				keyboard = {
					xkb.layout = osConfig.services.xserver.xkb.layout;
					numlock = true;
				};

				touchpad = {
					tap = true;
					natural-scroll = true;
				};

				focus-follows-mouse.enable = true;
			};

			layout = {
				gaps = 16;
				center-focused-column = "never";

				preset-column-widths = [
					{ proportion = 1. / 3.; }
					{ proportion = 1. / 2.; }
					{ proportion = 2. / 3.; }
					{ proportion = 1. / 1.; }
				];

				/*
				preset-column-heights = [
					{ proportion = 1. / 1.; }
					{ proportion = 1. / 2.; }
				];
				*/

				default-column-width.proportion = 1. / 2.;

				focus-ring.enable = false;
				border.enable = false;
			};

			prefer-no-csd = true;

			spawn-at-startup = [
				{ argv = [ "swww" ]; }
			];

			screenshot-path = "${config.home.homeDirectory}/Pictures/Screenshot/%Y%m$d.png";
			hotkey-overlay.skip-at-startup = true;

			window-rules = [
				{
					clip-to-geometry = true;
					geometry-corner-radius = let
							radius = 12.0;
						in
						{

						bottom-right = radius;
						bottom-left = radius;
						top-left = radius;
						top-right = radius;
					};
				}

				{
					opacity = 0.8;
					matches = [{ is-focused = false; }];
				}

				{
					open-floating = true;
					matches = [{
						app-id = "r#\"firefox$\"#";
						title = "^Picture-in-Picture$";
					}];
				}

				{
					block-out-from = "screen-capture";
					matches = [{ app-id = "r#\"bitwarden\"#"; }];
				}
			];
		};
	};

}
