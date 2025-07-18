{ pkgs, osConfig, ... }:

{

	gtk = {
		enable = osConfig.services.desktopManager.gnome.enable;

		font = {
			name = "Inter";
			package = pkgs.inter;
			size = 11;
		};

		iconTheme = {
			name = "MoreWaita";
			package = pkgs.morewaita-icon-theme;
		};

		gtk3.extraConfig.Settings = ''
			gtk-application-prefer-dak-theme=1
		'';

		gtk4.extraConfig.Settings = ''
			gtk-application-prefer-dark-theme=1
		'';
	};

}
