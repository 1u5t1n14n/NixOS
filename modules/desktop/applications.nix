{ ... }:

{

	xdg.mime = {
		enable = true;
		defaultApplications = {
			"image/jpeg" = "org.gnome.Loupe.desktop";
			"image/svg+xml" = "org.gnome.Loupe.desktop";
			"image/png" = "org.gnome.Loupe.desktop";

			"application/pdf" = "org.gnome.Papers.desktop";
			"application/epub+zip" = "calibre-ebook-viewer.desktop";
			"application/x-mobipocket-ebook" = "calibre-ebook-viewer.desktop";
			"inode/directory" = [
				"org.gnome.Nautilus.desktop"
				"nautilus.desktop"
			];
		};
	}

}
