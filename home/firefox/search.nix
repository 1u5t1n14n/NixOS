{ lib, ... }:

{

	programs.firefox.profiles.default.search = {
		default = "ddg";
		engines = {
			ddg = {
				name = "Quacksy Duck";
				urls = lib.mkForce [{ template = "https://noai.duckduckgo.com/?q={searchTerms}"; }];
				iconMapObj."16" = lib.mkForce "https://duckduckgo.com/favicon.ico";
			};
			wiki = {
				name = "Wikipedia Enzyklopädie";
				urls = [{ template = "https://de.wikipedia.org/wiki/Spezial:Suche?search={searchTerms}&go=Artikel-Suche"; }];
				iconMapObj."16" = "https://de.wikipedia.org/favicon.ico";
				definedAliases = [ "@w" ];
			};
			nueschtOS = {
				name = "NüschtOS Sucheingabe";
				urls = [{ template = "https://search.xn--nschtos-n2a.de/?query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@n" ];
			};
			nixPackages = {
				name = "Nix Packages";
				urls = [{ template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@np" ];
			};
			nixOptions = {
				name = "NixOS Options";
				urls = [{ template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@no" ];
			};
			nixWiki = {
				name = "NixOS Wiki";
				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@nw" ];
			};
			synchronKartei = {
				name = "Synchronkartei";
				urls = [{ template = "https://synchronkartei.de/suche?q={searchTerms}"; }];
				iconMapObj."16" = "https://synchronkartei.de/favicon.ico";
				definedAliases = [ "@sk" ];
			};
			archWiki = {
				name = "Arch Wiki";
				urls = [{ template = "https://wiki.archlinux.org/title/Special:Search/{searchTerms}"; }];
				iconMapObj."16" = "https://archlinux.org/favicon.ico";
				definedAliases = [ "@aw" ];
			};
			youtube = {
				name = "YouTube";
				urls = [{ template = "https://youtube.com/results?search_query={searchTerms}"; }];
				iconMapObj."16" = "https://youtube.com/favicon.ico";
				definedAliases = [ "@yt" ];
			};

			bing.metaData.hidden = true;
			g.metaData.hidden = true;
			google.metaData.hidden = true;

			ddg.metaData.alias = "@d";
		};
	};

}
