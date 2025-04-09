{ ... }:

{

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		dotDir = ".config/zsh";
		shellAliases = {
			spf = "superfile";
		};
	};

}
