{ userName, ... }:

{

	services.syncthing = {
		enable = true;
		openDefaultPorts = true;
		settings.gui = {
			user = "${userName}";
			password = "goodPassword";
		};
	};

}
