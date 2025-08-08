{ host, ... }:

{

	services.writefreely = {
		enable = true;

		admin.name = host.user;

		host = "0.0.0.0";

		settings = {
			server.port = 3002;
		};
	};

}
