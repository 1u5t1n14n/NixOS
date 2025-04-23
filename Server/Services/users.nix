{ pkgs, config, ... }:

{

	users.users.kian = {
		isNormalUser = true;
		createHome = true;
		hashedPasswordFile = config.sops.secrets."user/kian".path;
		description = "Kian";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" ];
		packages = with pkgs; [ ];
	};

}
