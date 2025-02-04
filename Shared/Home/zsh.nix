{ pkgs, config, hostName, userName, ... }:

{

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		shellAliases = {
			c = "clear";
			spf = "superfile";
			f = "vi $(fzf)";
			update = "find ~/.config -name '*.HMbackup*' -delete && sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/Repositories/NixOS#${hostName} && find ~/.config -name '*.HMbackup*' -delete";
		};
	};

}
