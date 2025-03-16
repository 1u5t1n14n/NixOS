{ pkgs, ... }:

let
	pass = builtins.getEnv "KIAN";
{

	users.users.kian = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "${pass}";
		description = "Kian";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" ];
		packages = with pkgs; [ ];
	};

}
