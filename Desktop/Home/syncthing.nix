{ ... }:

{

	xdg.desktopEntries = {
		syncthing = {
			name = "Syncthing";
			exec = "epiphany http://localhost:8384";
			icon = "/run/current-system/sw/share/icons/MoreWaita/scalable/apps/syncthing-gtk.svg";
			comment = "An shortcut to the Web UI";
			categories = [ "Utility" ];
		};
	};

}
