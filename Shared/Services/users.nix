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
	users.users.kian = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "$y$j9T$OPBgQ9p/.wQp/w73CWohx/$aochBGA4fXfdeifRAsPhSYPNhfprwJXsE5wwmuneQT7";
		description = "Kians User";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" ];
		packages = with pkgs; [ ];
	};


	security.sudo = {
		enable = true;
		extraConfig = ''
			Defaults env_keep += "EDITOR"
		'';
	};

}
