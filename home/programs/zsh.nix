{ config, pkgs, ... }:

{

	programs.zsh = {
		enable = true;
		autosuggestion = {
			enable = true;
		};
		enableCompletion = true;
		shellAliases = {
			spf = "superfile";
			f = "vi $(fzf)";
			update = "find ~/.config -name '*.HMbackup*' -delete && sudo nixos-rebuild switch --flake /home/1u5t1n14n/Repositories/NixOS#Morpheus && find ~/.config -name '*.HMbackup*' -delete";
		};
	};

}
