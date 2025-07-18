{ ... }:

{

	dconf.settings = {
		"org/gnome/gnome-session".logout-prompt = false;

		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			cursor-blink = false;
			locate-pointer = false;

			clock-show-seconds = true;
			clock-show-date = false;
		};

		# Wellbeing
		"org/gnome/desktop/break-reminders".selected-breaks = [ "eyesight" "movement" ];
		"org/gnome/desktop/break-reminders/movement".duration-seconds = 180;
		"org/gnome/desktop/break-reminders/eyesight".play-sound = false;

		"org/gnome/desktop/privacy" = {
			recent-files-max-age = 30;
			remove-old-temp-files = true;
			remove-old-trash-files = true;
		};
	};

}
