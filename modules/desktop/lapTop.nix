{ config, ... }:

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
			enable = !config.services.power-profiles-daemon.enable;

			settings = {
				START_CHARGE_THRESH_BAT0 = 40;
				STOP_CHARGE_THRESH_BAT0 = 80;
			};
		};
	};

}
