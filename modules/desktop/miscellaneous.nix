{ pkgs, config, ... }:

{

	environment = {
		sessionVariables.ANKI_WAYLAND = 1;

		systemPackages = with pkgs; [
			inkscape geogebra6 obsidian zed-editor jetbrains.clion keepassxc
			wezterm anki-bin qemu quickemu xorg.xprop
		];
	};

	xdg.terminal-exec = {
		enable = true;
		settings.default = [ "org.wezfurlong.wezterm.desktop" ];
	};

	services.blueman.enable = config.hardware.bluetooth.enable;
	hardware.bluetooth.enable = true;

}
