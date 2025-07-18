{ host, ... }:

{

	programs.git = {
		enable = true;
		userName = host.user;
		userEmail = "177038973+1u5t1n14n@users.noreply.github.com";
	};

	programs.gh.enable = true;

}
