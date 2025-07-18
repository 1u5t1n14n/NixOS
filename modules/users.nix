{ host, pkgs, lib, config, ... }:

let
	secret = config.sops.secrets;

in
{

	users = {
		mutableUsers = false;

		users = {
			root.hashedPasswordFile = secret."user/root".path;
			${host.user} = {
				isNormalUser = true;
				createHome = true;
				hashedPasswordFile = secret."user/user".path;
				extraGroups = [ "networkmanager" "wheel" ];
				description = host.user;
				shell = pkgs.zsh;
				packages = with pkgs; [ ];
			};

			kian = lib.mkIf (!host.hasDesktop) {
				isNormalUser = true;
				createHome = true;
				home = "/var/lib/Kian";
				hashedPasswordFile = secret."user/kian".path;
				extraGroups = [ "networkmanager" ];
				description = "Kian";
				useDefaultShell = true;
				packages = with pkgs; [ ];
			};
		};
	};

}
