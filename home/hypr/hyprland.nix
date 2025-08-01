{ osConfig, ... }:

{

	wayland.windowManager.hyprland = {
		enable = osConfig.programs.hyprland.enable;

		package = null;
		portalPackage = null;

		settings = {
		};
	};

}
