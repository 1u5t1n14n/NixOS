{ pkgs, host, config, ... }:

{

	programs = {
		bat = {
			enable = true;
			settings = { };
			extraPackages = with pkgs.bat-extras; [
				batman
				batwatch
				core
				batgrep
				batpipe
				batdiff
				prettybat
			];
		};

		lazygit = {
			enable = true;
			settings = { };
		};

		neovim = {
			enable = true;
			package = pkgs.neovim-unwrapped;

			viAlias = true;
			vimAlias = true;

			defaultEditor = true;
		};

		nano.enable = true;
		git.enable = true;

		gnupg.agent = {
			enable = true;
			pinentryPackage = pkgs.pinentry-curses;
			enableSSHSupport = !config.programs.ssh.startAgent;
		};
	};

	services.pcscd.enable = ((config.programs.gnupg.agent.pinentryPackage == pkgs.pinentry-curses) && config.programs.gnupg.agent.enable);

	environment.systemPackages = with pkgs; [
		ripgrep fastfetch onefetch tree gcc tree-sitter
		fastfetch fzf figlet zip unzip wget yt-dlp btop
		gh cmatrix browsh imagemagick superfile gnumake
		pandoc typst gnupg lynx ffmpeg-full texliveFull
		bitwarden-cli ocrmypdf cava zbar
	]

	++ lib.optionals host.hasDesktop [ wl-clipboard ];

}
