{ config, pkgs, lib, ... }:

{

	services.xserver = {
		videoDrivers = [ "displaylink" "modesetting" ];
		displayManager.sessionCommands = ''
			${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
		'';
	};

	# GNOME
	environment.systemPackages = [ pkgs.displaylink pkgs.xorg.xrandr ];
	boot = {
		extraModulePackages = [ config.boot.kernelPackages.evdi ];
		initrd.kernelModules = [ "evdi" ];
	};
	systemd.services.dlm.wantedBy = [ "multi-user.target" ];

}
