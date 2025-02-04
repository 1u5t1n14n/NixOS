{ pkgs, ... }:

{

	programs.firefox.profiles.enlightedFox.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
		clearurls
		duckduckgo-privacy-essentials
		facebook-container
		gnome-shell-integration
		google-container
		multi-account-containers
		privacy-badger
		private-relay
		return-youtube-dislikes
		ublock-origin
		vimium
	];

}
