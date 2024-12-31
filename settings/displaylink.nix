{ pkgs, ... }:

{

	services.xserver.videoDrivers = [ "intel" "displaylink" "modesetting" ];
	services.xserver.xrandrHeads = [
		{ output = "eDP-1"; primary = true; }
		{ output = "HDMI-1"; }
	];

	services.xserver.displayManager.setupCommands = ''
		${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --output HDMI-1 --mode 1920x1080 --right-of eDP-1
	'';
	boot.kernelParams = [ "video=HDMI-1:1920x1080@60" ];
	environment.systemPackages = with pkgs; [
		arandr
		mons
		autorandr
	];

}
