{ host, ... }:

{

	services.writefreely = {
		enable = true;

		admin.name = host.user;

		host = "localhost";

		settings = {
			server.port = 3002;
		};
	};

}
