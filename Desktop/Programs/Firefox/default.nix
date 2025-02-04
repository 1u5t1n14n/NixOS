{ ... }:

{

	imports = [
		./preferences.nix
		./languagePacks.nix
	];

	programs.firefox.enable = true;
	programs.firefox.nativeMessagingHosts.gsconnect = true;
	programs.firefox.policies = {
		DisableFirefoxScreenshots = true;
		DisableFirefoxStudies = true;
		DisablePocket = true;
		DisableProfileImport = true;
		DisableSetDesktopBackground = true;
		DisableTelemetry = true;
		DisplayBookmarksToolbar = true;
		NoDefaultBookmarks = true;
		OfferToSaveLogins = false;
		ShowHomeButton = false;
		TranslateEnabled = true;
	};

	environment.sessionVariables = {
		MOZ_USE_XINPUT2 = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

}
