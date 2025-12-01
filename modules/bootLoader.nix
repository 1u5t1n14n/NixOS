{ pkgs, config, ... }:

let
	cfg = config.boot.plymouth;

in
{

	boot = {
		consoleLogLevel = 3;
		initrd = {
			verbose = false;
		};

		kernelParams = [
			"quiet"
			"splash"
			"boot.shell_on_fail"
			"udev.log_priority=3"
			"rd.systemd.show_status=auto"

			"random.trust_cpu=off"
		];

		loader = {
			timeout = 0;
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};

		plymouth = {
			enable = true;
			theme = "sphere";
			themePackages = with pkgs; [
				(adi1090x-plymouth-themes.override {
					selected_themes = [ cfg.theme ];
				})
			];
			font = "${pkgs.inter}/share/fonts/truetype/InterVariable.ttf";
		};
	};

}
