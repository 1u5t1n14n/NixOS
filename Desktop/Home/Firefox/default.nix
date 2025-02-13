{ ... }:

{

	imports = [
		./extensions.nix
		./search.nix
	];

	programs.firefox.enable = true;
	programs.firefox.profiles.risingFox = {
		name = "Arkenfox";
		isDefault = true;
		id = 0;
		settings = {
			"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
			"browser.ctrlTab.sortByRecentlyUsed" = true;
			"browser.tabs.hoverPreview.enabled" = true;
			"browser.tabs.hoverPreview.showThumbnails" = true;
			"sidebar.verticalTabs" = true;
			"sidebar.revamp" = true;
			"ui.systemUsesDarkTheme" = 1;
			"browser.ctrlTab.recentlyUsedOrder" = true;
			"accessibility.browsewithcaret" = true;
			"browser.tabs.closeWindowWithLastTab" = false;
			"browser.toolbars.bookmarks.visibility" = "never";
			"browser.tabs.tabmanager.enabled" = false;
			"browser.tabs.unloadTabInContextMenu" = true;
			"browser.tabs.warnOnCloseOtherTabs" = false;
			"browser.tabs.closeTabByDblclick" = true;
		};
	};

}
