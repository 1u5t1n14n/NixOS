{ ... }:

{

	programs.thunderbird = {
		enable = true;

		policies = {
			CaptivePortal = false;
			DisableTelemetry = true;

			OfferToSaveLogins = false;
			PasswordManagerEnabled = false;
		};
	};

}
