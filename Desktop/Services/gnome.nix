{ ... }:

{

	services.xserver = {
		displayManager.gdm = {
			enable = true;
			wayland = true;
			banner = ''
				This is a test.
			'';
		};
		desktopManager.gnome.enable = true;
	};

	services.accounts-daemon.enable = true;
	services.gnome.evolution-data-server.enable = true;
	services.gnome.gnome-keyring.enable = true;
	services.gnome.gnome-online-accounts.enable = true;
	services.gvfs.enable = true;
	services.libinput.enable = true;

	environment.sessionVariables = {
		QT_QPA_PLATFORMTHEME = "gtk2";
	};

}
