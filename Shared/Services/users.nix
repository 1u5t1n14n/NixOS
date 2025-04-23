{ pkgs, userName, config, ... }:

{

	users.users."${userName}" = {
		isNormalUser = true;
		createHome = true;
		hashedPasswordFile = "${config.sops.secrets."user/user".path}";
		initialHashedPassword = "${builtins.getEnv "PASSWD"}";
		description = "${userName}";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [ ];
	};

	users.users.root.hashedPasswordFile = "${config.sops.secrets."user/root".path}";

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
