{ ... }:

{

	programs.firefox.profiles.default.search = {
		default = "DuckDuckGo";
		engines = {
			"NüschtOS Sucheingabe" = {
				name = "NüschtOS Sucheingabe";
				urls = [{ template = "https://search.xn--nschtos-n2a.de/?query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@n" ];
			};
			"Nix Packages" = {
				name = "Nix Packages";
				urls = [{ template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@np" "!np" ];
			};
			"NixOS Options" = {
				name = "NixOS Options";
				urls = [{ template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@no" "!no" ];
			};
			"NixOS Wiki" = {
				name = "NixOS Wiki";
				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@nw" "!nw" ];
			};
			"Synchronkartei" = {
				name = "Synchronkartei";
				urls = [{ template = "https://synchronkartei.de/suche?q={searchTerms}"; }];
				iconMapObj."16" = "https://synchronkartei.de/favicon.ico";
				definedAliases = [ "@sk" "!sk" ];
			};
			"Arch Wiki" = {
				name = "Arch Wiki";
				urls = [{ template = "https://wiki.archlinux.org/title/Special:Search/{searchTerms}"; }];
				iconMapObj."16" = "https://archlinux.org/favicon.ico";
				definedAliases = [ "@aw" "!aw" ];
			};
			"YouTube" = {
				name = "YouTube";
				urls = [{ template = "https://youtube.com/results?search_query={searchTerms}"; }];
				iconMapObj."16" = "https://youtube.com/favicon.ico";
				definedAliases = [ "@bg" "!bg" ];
			};
			"Invidious" = {
				name = "Invidious";
				urls = [{ template = "https://yewtu.be/results?search_query={searchTerms}"; }];
				iconMapObj."16" = "https://invidious.io/favicon.ico";
				definedAliases = [ "@yt" "!yt" ];
			};

			"Bing".metaData.hidden = true;
			"Google".metaData.hidden = true;
			"DuckDuckGo".metaData.alias = "@d";
		};
	};

}
