{ ... }:

{

	programs.firefox.profiles.default.search = {
		default = "ddg";
		engines = {
			"Nix Packages" = {
				name = "Nix Packages";
				urls = [{
					template = "https://search.nixos.org/packages";
					params = [
						{ name = "type"; value = "packages"; }
						{ name = "query"; value = "{searchTerms}"; }
					];
				}];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = 24 * 60 * 60 * 1000;
				definedAliases = [ "@np" ];
			};
			"NixOS Wiki" = {
				name = "NixOS Wiki";
				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = 24 * 60 * 60 * 1000;
				definedAliases = [ "@nw" ];
			};
			"YouTube" = {
				name = "YouTube";
				urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
				iconUpdateURL = "https://youtube.com/favicon.ico";
				updateInterval = 24 * 60 * 60 * 1000;
				definedAliases = [ "@yt" ];
			};

			"Bing".metaData.hidden = true;
			"Google".metaData.hidden = true;
		};
	};

}
