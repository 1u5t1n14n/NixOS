{ inputs, pkgs, ... }:

{

	programs.firefox.profiles.default.extensions = {
		packages = with pkgs.inputs.nur.repos.rycee.firefox-addons; [
			ublock-origin
			clearurls
			multi-account-containers
			facebook-container
			duckduckgo-privacy-essentials
			privacy-badger
		];
		settings."uBlock0@raymondhill.net".settings = {
			selectedFilterLists = [
				"ublock-filters"
				"ublock-badware"
				"ublock-privacy"
				"ublock-unbreak"
				"ublock-quick-fixes"
			];
		};

	};

}
