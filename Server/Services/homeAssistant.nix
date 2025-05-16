{ ... }:

{

	services.home-assistant = {
		enable = true;
		openFirewall = true;
		config = {
			default_config = { };
		};
	};

}
