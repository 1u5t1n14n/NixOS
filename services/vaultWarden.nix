{ ... }:

{

	services.vaultwarden = {
		enable = true;

		dbbackend = "sqlite";

		config = {
			ROCKET_ADDRESS = "0.0.0.0";
			ROCKET_PORT = 8222;
			SIGNUPS_ALLOWED = true;
		};
	};

}
