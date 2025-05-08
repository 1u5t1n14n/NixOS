{ pkgs, inputs, ... }:

{

	nixpkgs.overlays = [ inputs.nur.overlay ];

	programs.firefox.profiles.default.extensions = {
		force = true;
		packages = with pkgs.nur.repos.rycee.firefox-addons; [
			ublock-origin
			clearurls
			facebook-container
			duckduckgo-privacy-essentials
			privacy-redirect
			privacy-badger
			vimium
			return-youtube-dislikes
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
