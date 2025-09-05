{ host, ... }:

{

	services.vicinae = {
		enable = host.hasDesktop;
		autoStart = true;
	};

}
