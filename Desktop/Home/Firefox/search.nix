{ ... }:

{

	programs.firefox.profiles.risingFox.search = {
		force = true;
		default = "DuckDuckGo";
		engines = {
			"Google".metaData.alias = "@g";
			"DuckDuckGo".metaData.alias = "@d";
			"NixOS Options" = {
				urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@no" ];
			};
			"Startpage" = {
				urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
				iconUpdateURL = "https://www.startpage.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@sp" ];
			};
			"Qwant" = {
				urls = [{ template = "https://www.qwant.com/?q={searchTerms}"; }];
				iconUpdateURL = "https://www.qwant.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@qw" ];
			};
			"Presearch" = {
				urls = [{ template = "https://presearch.com/search?q={searchTerms}"; }];
				iconUpdateURL = "https://www.presearch.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@ps" ];
			};
			"Brave" = {
				urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
				iconUpdateURL = "https://www.brave.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@br" ];
			};
			"Reverse Dictionary" = {
				urls = [{ template = "https://www.onelook.com/reverse-dictionary.shtml?s={searchTerms}"; }];
				iconUpdateURL = "https://onelook.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@rw" ];
			};
			"Pexels" = {
				urls = [{ template = "https://www.pexels.com/search/{searchTerms}"; }];
				iconUpdateURL = "https://www.pexels.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@px" ];
			};
			"NixOS Packages" = {
				urls = [{ template = "https://search.nixos.org/packages?type=packages&query={searchTerms}"; }];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@np" ];
			};
			"YouTube" = {
				urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
				iconUpdateURL = "https://www.youtube.com/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@yt" ];
			};
			"Arch Wiki" = {
				urls = [{ template = "https://wiki.archlinux.org/title/Special:Search/{searchTerms}"; }];
				iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
				updateInterval = 7 * 24 * 60 * 60 * 1000;
				definedAliases = [ "@aw" ];
			};
		};
	};

}
