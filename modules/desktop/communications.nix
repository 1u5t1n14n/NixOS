{ pkgs, ... }:

{

	programs.chromium = {
		enable = true;
	};

	programs.thunderbird = {
		enable = true;

		policies = {
			CaptivePortal = false;
			DisableTelemetry = true;

			OfferToSaveLogins = false;
			PasswordManagerEnabled = false;
		};
	};

	environment.systemPackages = with pkgs; [
		bitwarden-desktop signal-desktop ente-auth
		ungoogled-chromium
	];

}
