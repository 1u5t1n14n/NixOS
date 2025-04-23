{ pkgs, userName, config, ... }:

{

	users.users."${userName}" = {
		isNormalUser = true;
		createHome = true;
		hashedPasswordFile = "${config.sops.secrets."user/user".path}";
		description = "${userName}";
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [ ];
	};

	users.users.root.hashedPasswordFile = "${config.sops.secrets."user/root".path}";

	users.mutableUsers = false;

}
