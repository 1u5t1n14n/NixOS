{ ... }:

{

	powerManagement.enable = true;

	services = {
		logind = {
			lidSwitch = "poweroff";
			lidSwitchExternalPower = "poweroff";
			lidSwitchDocked = "ignore";
		};

		thermald.enable = true;

		tlp = {
			enable = true;

			settings = {
				START_CHARGE_THRESH_BAT0 = 40;
				STOP_CHARGE_THRESH_BAT0 = 80;
			};
		};
	};

}
