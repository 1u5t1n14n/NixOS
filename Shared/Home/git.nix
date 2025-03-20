{ ... }:

{

	programs.git = {
		enable = true;
		userName = "${builtins.getEnv "USER"}";
		userEmail = "${builtins.getEnv "GITEMAIL"}";
	};

}
