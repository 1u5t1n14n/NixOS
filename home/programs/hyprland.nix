{ config, pkgs, ... }:

{

	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.settings = {
		bind = [
			"ALT, W, exec, firefox"
			"ALT, RETURN, exec, wezterm"
			"ALT, SPACE, exec, rofi -show combi -combi-modes 'drun,recursivebrowser,keys,ssh,window,run' -modes combi"
			"ALT, F, exec, nautilus"
			"ALT, V, exec, vi %F"

			"ALT, Q, killactive"
			"ALT, ESCAPE, exit"
			"ALT, S, togglefloating"
			"ALT, P, pseudo"
			"ALT, TAB, movefocus, u"

			"SHIFTALT, H, movewindow, l"
			"SHIFTALT, J, movewindow, d"
			"SHIFTALT, K, movewindow, u"
			"SHIFTALT, L, movewindow, r"

			",F11, fullscreen, 0"
			",F2, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",F3, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",F1, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

			"SUPER, TAB, workspace, previous"

			"SUPER, H, workspace, -1"
			"SUPER, L, workspace, +1"

			"SUPER, 1, workspace, 1"
			"SUPER, 2, workspace, 2"
			"SUPER, 3, workspace, 3"
			"SUPER, 4, workspace, 4"
			"SUPER, 5, workspace, 5"
			"SUPER, 6, workspace, 6"
			"SUPER, 7, workspace, 7"
			"SUPER, 8, workspace, 8"
			"SUPER, 9, workspace, 9"

			"SHIFTSUPER, 1, movetoworkspace, 1"
			"SHIFTSUPER, 2, movetoworkspace, 2"
			"SHIFTSUPER, 3, movetoworkspace, 3"
			"SHIFTSUPER, 4, movetoworkspace, 4"
			"SHIFTSUPER, 5, movetoworkspace, 5"
			"SHIFTSUPER, 6, movetoworkspace, 6"
			"SHIFTSUPER, 7, movetoworkspace, 7"
			"SHIFTSUPER, 8, movetoworkspace, 8"
			"SHIFTSUPER, 9, movetoworkspace, 9"
		];
		bindm = [
			"ALT, mouse:272, movewindow"
			"SHIFTALT, mouse:272, resizewindow"
			"ALT, mouse:273, resizewindow"
		];
		windowrulev2 = [
			"float, class:(Calculator)"
			"float, class:(Dialect)"
			"float, class:(Frog)"
			"float, class:(Image Viewer)"
			"float, class:(Nautilus)"
			"float, class:(Characters)"
		];
		monitor = [
			"DVI-I-1, 1920x1080@100.00, 0x0, 1"
			"eDP-1, 1920x1080@60.00, 1920x0, 1"
		];
		env = [
			"XCURSOR_SIZE,12"
			"HYPRCURSOR_SIZE,12"
		];
		exec-once = [
			"hyprpaper"
		];
		general = {
			gaps_in = 8;
			gaps_out = 15;
			border_size = 0;
			resize_on_border = true;
			no_focus_fallback = false;
			hover_icon_on_border = true;
			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(595959aa)";
			layout = "dwindle";
		};
		dwindle = {
			pseudotile = 1;
		};
		decoration = {
			active_opacity = 0.9;
			fullscreen_opacity = 0.98;
			inactive_opacity = 0.8;
			drop_shadow = true;
			rounding = 15;
			blur = {
				enabled = true;
				size = 10;
				ignore_opacity = true;
				noise = 0.0145;
				popups = false;
			};
		};
		animations = {
			enabled = true;
			bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
			animation = [
				"windows, 1, 7, overshot, slide"
				"border, 1, 10, default"
				"fade, 1, 6, default"
				"workspaces, 1, 6, overshot, slidevert"
			];
		};
		input = {
			kb_layout = "de";
			numlock_by_default = true;
			follow_mouse = 1;
			natural_scroll = false;
			touchpad = {
				natural_scroll = true;
				disable_while_typing = false;
				drag_lock = true;
			};
			sensitivity = 0;
		};
		gestures = {
			workspace_swipe = true;
			workspace_swipe_min_fingers = true;
			workspace_swipe_touch = true;
			workspace_swipe_forever = true;
		};
		misc = {
			disable_hyprland_logo = true;
			disable_splash_rendering = true;
			animate_manual_resizes = true;
			layers_hog_keyboard_focus = true;
			allow_session_lock_restore = true;
		};
	};

	home.pointerCursor = {
		gtk.enable = true;
		name = "Adwaita";
		package = pkgs.adwaita-icon-theme;
		size = 24;
	};
	gtk = {
		enable = true;
		iconTheme = {
			package = pkgs.morewaita-icon-theme;
			name = "MoreWaita";
		};
	};

	home.file.".config/hypr/hyprpaper.conf".text = ''
		preload = /home/1u5t1n14n/Pictures/Wallpapers/Wallpaper.png

		wallpaper = ,/home/1u5t1n14n/Pictures/Wallpapers/Wallpaper.png

		splash = false
	'';

	home.file.".config/xdg-desktop-portal/hyprland-portals.conf".text = ''
[preferred]
default = hyprland;gtk
org.freedesktop.impl.portal.FileChooser = gnome
	'';

}
