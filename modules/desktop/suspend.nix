{ ... }:

let
	enable = false;

in
{

	systemd.targets = {
		sleep.enable = enable;
		suspend.enable = enable;
		hibernate.enable = enable;
		hybrid-sleep.enable = enable;
	};

}
