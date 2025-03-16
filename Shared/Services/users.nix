{ pkgs, userName, ... }:

let
	pass = builtins.getEnv "PASSWD";

in {

	users.users."${userName}" = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "${pass}";
		description = "${userName}";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [ ];
	};

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
