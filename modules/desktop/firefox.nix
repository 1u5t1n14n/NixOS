{ config, lib, ... }:

let
	getUrl = addonName: authorId: 
		"http://addons.mozilla.org/firefox/downloads/latest/${addonName}/addon-${toString authorId}-latest.xpi";

in
{

	programs.firefox = {
		enable = true;
		languagePacks = [ "de" "en-GB" ];
		policies = {
			AppAutoUpdate = false;
			AutofillAddressEnabled = true;
			AutofillCreditCardEnabled = false;
			NewTabPage = false;
			OfferToSaveLogins = false;
			NoDefaultBookmarks = true;
			ShowHomeButton = false;
			StartDownloadsInTempDirectory = true;

			CaptivePortal = false;
			DisableAccounts = true;
			DisableEncryptedClientHello = true;
			DisableFeedbackCommands = true;
			DisableFirefoxAccounts = true;
			DisableFirefoxScreenshots = true;
			DisableFirefoxStudies = true;
			DisableFormHistory = true;
			DisableSetDesktopBackground = true;
			DisableTelemetry = true;

			DontCheckDefaultBrowser = true;

			Extensions = {
				Install = [
					"${getUrl "ublock-origin" 11423598}"
					"${getUrl "clearurls" 13196993}"
					"${getUrl "consent-o-matic" 18863655}"
					"${getUrl "tineye-reverse-image-search" 3304309}"
					"${getUrl "facebook-container" 4757633}"
					"${getUrl "localtube-manager" 18857709}"
				];
			};
		};
	};

	environment.sessionVariables = {
		MOZ_USE_XINPUT2 = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

}
