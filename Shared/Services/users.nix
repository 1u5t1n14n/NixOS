{ pkgs, userName, ... }:

{

	users.users."${userName}" = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "$y$j9T$HySwm5pX60uPCduxwrM5z/$eE2wbhrAPu6jqTyKg7MbJrQCH6WEg0niHf1hMvkkSO6";
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

}
