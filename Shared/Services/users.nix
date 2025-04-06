{ pkgs, userName, ... }:

{

	users.users."${userName}" = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "${builtins.getEnv "PASSWD"}";
		description = "${userName}";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [ ];
	};

	users.users.root.initialHashedPassword = "${builtins.getEnv "ROOT"}";

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
