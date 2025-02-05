{ ... }:

{

	imports = [
		./extensions.nix
		./search.nix
	];

	programs.firefox.enable = true;
	programs.firefox.profiles.risingFox = {
		name = "Rising Fox";
		isDefault = true;
		id = 0;
		settings = {
			"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
			"browser.ctrlTab.sortByRecentlyUsed" = true;
			"browser.tabs.hoverPreview.enabled" = true;
			"browser.tabs.hoverPreview.showThumbnails" = true;
			"sidebar.verticalTabs" = true;
			"sidebar.revamp" = true;
		};
	};

}
