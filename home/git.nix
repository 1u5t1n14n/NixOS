{ host, ... }:

{

	programs.git = {
		enable = true;
		settings.user = {
			name = host.user;
			email = "177038973+1u5t1n14n@users.noreply.github.com";
		};
	};

	programs.gh.enable = true;

}
