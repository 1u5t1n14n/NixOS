{ ... }:

{

	services.grocy = {
		enable = true;
		hostName = "localhost";
		settings = {
			culture = "de";
			currency = "EUR";
		};
	};

}
