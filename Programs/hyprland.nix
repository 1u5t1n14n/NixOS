{ pkgs, ... }:

{

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.xserver.updateDbusEnvironment = true;

	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		XDG_SESSION_TYPE = "wayland";
	};

	environment.systemPackages = with pkgs; [
		rofi-wayland
		hyprpaper
		mpv
		superfile
		zathura
		hyprpicker
	];

}
