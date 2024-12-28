{ config, pkgs, ... }:

{

	users.users."1u5t1n14n" = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "$y$j9T$HySwm5pX60uPCduxwrM5z/$eE2wbhrAPu6jqTyKg7MbJrQCH6WEg0niHf1hMvkkSO6";
		description = "1u5t1n14n";
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

}
