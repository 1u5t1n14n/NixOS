{ pkgs, inputs, ... }:

{

	nixpkgs.overlays = [ inputs.nur.overlay ];

	programs.firefox.profiles.default.extensions = {
		force = true;
		packages = with pkgs.nur.repos.rycee.firefox-addons; [
			ublock-origin
			clearurls
			multi-account-containers
			facebook-container
			duckduckgo-privacy-essentials
			privacy-badger
			vimium
			return-youtube-dislikes
			proton-vpn
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
