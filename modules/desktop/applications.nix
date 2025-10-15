{ ... }:

let
	editor = "nvim.desktop";
	imageViewer = "org.gnome.Loupe.desktop";

in
{

	xdg.mime = {
		enable = true;
		defaultApplications = {
			"image/jpeg" = imageViewer;
			"image/svg+xml" = imageViewer;
			"image/png" = imageViewer;
			"image/gif" = imageViewer;

			"application/octet-stream" = [
				"org.keepassxc.KeePassXC.desktop"
				"org.kiwix.desktop.desktop"
				editor
			];

			"application/vnd.oasis.opendocument.text" = "writer.desktop";
			"application/vnd.sqlite3" = "base.desktop";
			"application/pdf" = "org.gnome.Papers.desktop";
			"application/epub+zip" = "calibre-ebook-viewer.desktop";
			"application/x-mobipocket-ebook" = "calibre-ebook-viewer.desktop";
			"application/json" = editor;
			"application/pgp-keys" = "org.gnome.seahorse.Application.desktop";
			"application/pgp-encrypted" = editor;

			"text/plain" = editor;
			"text/xml" = editor;
			"text/x-objective-c" = editor;

			"inode/directory" = [
				"nautilus.desktop"
				"org.gnome.Nautilus.desktop"
			];
		};
	};

}
