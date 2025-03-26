{ ... }:

let
	updateInterval = 4 * 7 * 24 * 60 * 60 * 1000;

in {

	programs.firefox.profiles.default.search = {
		default = "ddg";
		engines = {
			nixPackages = {
				name = "Nix Packages";
				urls = [{
					template = "https://search.nixos.org/packages";
					params = [
						{ name = "type"; value = "packages"; }
						{ name = "query"; value = "{searchTerms}"; }
					];
				}];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = updateInterval;
				definedAliases = [ "@np" ];
			};
			nixosWiki = {
				name = "NixOS Wiki";
				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
				iconUpdateURL = "https://wiki.nixos.org/favicon.ico";
				updateInterval = updateInterval;
				definedAliases = [ "@nw" ];
			};
			youTube = {
				name = "YouTube";
				urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
				iconUpdateURL = "https://youtube.com/favicon.ico";
				updateInterval = updateInterval;
				definedAliases = [ "@nw" ];
			};

			"Bing".metaData.hidden = true;
			"Google".metaData.hidden = true;
		};
	};

}
