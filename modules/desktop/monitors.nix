{ config, pkgs, lib, ... }:

{

	services.xserver = {
		videoDrivers = [ "modesetting" ]

		++ lib.optionals config.nixpkgs.config.allowUnfree [ "displaylink" ];

		displayManager.sessionCommands = lib.mkIf config.nixpkgs.config.allowUnfree ''
			${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
		'';
	};

	# GNOME
	environment.systemPackages = [ pkgs.xorg.xrandr ]

	++ lib.optionals config.nixpkgs.config.allowUnfree [ pkgs.displaylink ];

	boot = {
		extraModulePackages = [ config.boot.kernelPackages.evdi ];
		initrd.kernelModules = [ "evdi" ];
	};
	systemd.services.dlm.wantedBy = [ "multi-user.target" ];

}
