{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		inkscape geogebra6 obsidian zed-editor
		jetbrains.clion xorg.xprop keepassxc
		wezterm

		bitwarden-desktop signal-desktop ente-auth
	];

	xdg.terminal-exec = {
		enable = true;
		settings.default = [ "org.wezfurlong.wezterm.desktop" ];
	};

}
