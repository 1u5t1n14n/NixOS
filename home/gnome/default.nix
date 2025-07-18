{ osConfig, ... }:

{

	imports = [
		./extensions.nix
		./keyBindings.nix
		./settings.nix
		./apps.nix
	];

	dconf.enable = osConfig.services.desktopManager.gnome.enable;

}
