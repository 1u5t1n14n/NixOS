{ ... }:

{

	security.sudo = {
		enable = true;
		extraConfig = ''
			Defaults env_keep += "EDITOR"
		'';
	};

	environment.sessionVariables = {
		SUDO_EDITOR = "nvim";
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

}
