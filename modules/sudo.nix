{ ... }:

{

	security.sudo = {
		enable = true;
		extraConfig = ''
			Defaults env_keep += "EDITOR"
		'';
	};

	environment.sessionVariables.EDITOR = "nvim";

}
