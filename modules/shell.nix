{ host, config, pkgs, lib, ... }:

let
	defaultShell = config.users.users.${host.user}.shell;

in
{

	programs.zsh = {
		# Only enable if it is the Users Shell
		enable = lib.mkIf (defaultShell == pkgs.zsh) true;

		enableCompletion = true;
		autosuggestions = {
			enable = true;
			strategy = [ "history" "completion" ];
		};
		syntaxHighlighting.enable = true;

		histSize = 10000;
		histFile = "$HOME/.zshHistory";

		shellAliases = {
			ll = "ls -l";
			spf = "superfile";
		};
	};

	users.defaultUserShell = defaultShell;
	environment = {
		shells = [ defaultShell ];
		systemPackages = [
			(lib.mkIf (defaultShell != pkgs.nushell) pkgs.nushell)
			defaultShell
		];
	};

	system.userActivationScripts.zshrc = lib.mkIf (defaultShell == pkgs.zsh) ''
		touch .zshrc
	'';

}
