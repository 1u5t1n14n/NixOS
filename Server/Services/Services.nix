{ ... }:

{

        imports = [
		./nginx.nix
		./kian.nix
		./syncthing.nix
		./radicale.nix
		./jellyfin.nix
		./calibre.nix
		./paperless.nix
		./searxng.nix
		./stirling.nix
	];

	services.dokuwiki.sites."localhost" = {
		enable = true;
		settings.title = "My Wiki";
	};

}
