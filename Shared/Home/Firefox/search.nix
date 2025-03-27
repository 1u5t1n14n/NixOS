{ ... }:

{

	programs.firefox.profiles.default.search = {
		default = "DuckDuckGo";
		engines = {
			"Nix Packages" = {
				name = "Nix Packages";
				urls = [{ template = "https://search.nixos.org/packages"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@np" ];
			};
			"NixOS Options" = {
				name = "NixOS Options";
				urls = [{ template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@no" ];
			};
			"NixOS Wiki" = {
				name = "NixOS Wiki";
				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
				iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				definedAliases = [ "@nw" ];
			};
			"YouTube" = {
				name = "YouTube";
				urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
				iconMapObj."16" = "https://youtube.com/favicon.ico";
				definedAliases = [ "@yt" ];
			};

			"Bing".metaData.hidden = true;
			"Google".metaData.hidden = true;
			"DuckDuckGo".metaData.alias = "@d";
		};
	};

}
