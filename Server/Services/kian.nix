{ ... }:

{

	users.users.kian = {
		isNormalUser = true;
		createHome = true;
		initialHashedPassword = "$y$j9T$OPBgQ9p/.wQp/w73CWohx/$aochBGA4fXfdeifRAsPhSYPNhfprwJXsE5wwmuneQT7";
		description = "Kians User";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" ];
		packages = with pkgs; [ ];
	};

}
