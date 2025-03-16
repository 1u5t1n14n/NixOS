{ pkgs, ... }:

{

	users.users.kian = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "${builtins.getEnv "KIAN"}";
		description = "Kian";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" ];
		packages = with pkgs; [ ];
	};

}
