{ pkgs, ... }:

{

	programs.firefox.profiles.risingFox.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
		clearurls
		duckduckgo-privacy-essentials
		multi-account-containers
		privacy-badger
		private-relay
		return-youtube-dislikes
		ublock-origin
		vimium
	];

}
