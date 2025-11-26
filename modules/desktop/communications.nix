{ pkgs, ... }:

{

	programs = {
		localsend = {
			enable = true;
			openFirewall = true;
		};

		chromium = {
			enable = true;
		};

		thunderbird = {
			enable = true;

			policies = {
				CaptivePortal = false;
				DisableTelemetry = true;

				OfferToSaveLogins = false;
				PasswordManagerEnabled = false;
			};
		};

		adb.enable = true;
	};

	environment.systemPackages = with pkgs; [
		bitwarden-desktop signal-desktop ente-auth
		ungoogled-chromium
	];

}
