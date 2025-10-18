{ pkgs, config, ... }:

{

	environment.systemPackages = with pkgs; [
		inkscape geogebra6 obsidian zed-editor
		jetbrains.clion xorg.xprop keepassxc
		wezterm anki-bin qemu quickemu
	];

	xdg.terminal-exec = {
		enable = true;
		settings.default = [ "org.wezfurlong.wezterm.desktop" ];
	};

	services.blueman.enable = config.hardware.bluetooth.enable;
	hardware.bluetooth.enable = true;

}
