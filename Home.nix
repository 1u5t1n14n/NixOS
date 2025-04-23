{ config, pkgs, userName, lib, ... }:

{

	imports = [
		./Shared/Home/Home.nix
	];

	home = {
		username = userName;
		homeDirectory = "/home/${config.home.username}";
		stateVersion = "25.05";
		packages = with pkgs; [ ];
		activation = {
			removeBackups = lib.hm.dag.entryAfter ["writeBoundary"] ''
				echo "Removing backup files..."
				find $HOME -name "*.hm-backup" -type f -delete
				echo "Backup files removed."
			'';
		};
	};

	programs.home-manager.enable = true;

}
