{ ... }:

{

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		shellAliases = {
			c = "clear";
			spf = "superfile";
			f = "vi $(fzf)";
		};
	};

}
