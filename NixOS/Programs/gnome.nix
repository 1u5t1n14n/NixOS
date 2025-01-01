{ pkgs, ... }:

{

	services.xserver = {
		displayManager.gdm = {
			enable = true;
			wayland = true;
		};
		desktopManager.gnome.enable = true;
	};

	environment.sessionVariables = {
		QT_QPA_PLATFORMTHEME = "gtk2";
	};

	services.libinput.enable = true;
	services.gnome.evolution-data-server.enable = true;
	services.gnome.gnome-online-accounts.enable = true;
	services.accounts-daemon.enable = true;
	services.gnome.gnome-keyring.enable = true;
	services.gvfs.enable = true;

	programs.nautilus-open-any-terminal.enable = true;
	programs.nautilus-open-any-terminal.terminal = "wezterm";

	environment.gnome.excludePackages = with pkgs; [
		baobab
		cheese
		geary
		gnome-connections
		gnome-console
		gnome-disk-utility
		gnome-logs
		gnome-music
		gnome-system-monitor
		gnome-text-editor
		gnome-tour
		gnome-weather
		nixos-render-docs
		seahorse
		simple-scan
		snapshot
		totem
		yelp
	];

	environment.systemPackages = with pkgs; [
		citations
		dconf-editor
		errands
		fragments
		gapless
		gnome-secrets
		gnome-tweaks
		impression
		memorado
		morewaita-icon-theme
		morphosis
		mousai
		mousam
		papers
		parabolic
		rnote
		snoop
		switcheroo
		tangram
		textpieces
		wike
		wordbook
	];

}
