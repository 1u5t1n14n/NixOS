{ host, pkgs, config, ... }:

let
	secret = config.sops.secrets;

in
{

	nix.settings.allowed-users = [ "@wheel" "root" host.user ];

	users = {
		mutableUsers = false;

		users = {
			root.hashedPasswordFile = secret."user/root".path;
			${host.user} = {
				isNormalUser = true;
				createHome = true;
				hashedPasswordFile = secret."user/main".path;
				extraGroups = [ "networkmanager" "wheel" ];
				description = host.user;
				shell = pkgs.zsh; #gonna change this later to nushell
				packages = with pkgs; [ ];
			};
		};
	};

}
