{ pkgs, host, config, ... }:

{

	programs = {
		bat = {
			enable = true;
			settings = { };
		};

		lazygit = {
			enable = true;
			settings = { };
		};

		neovim = {
			enable = true;
			package = pkgs.neovim-unwrapped;
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
		# Common CLIs
		ripgrep fastfetch onefetch tree gcc tree-sitter
		fastfetch fzf figlet zip unzip wget yt-dlp btop
		gh cmatrix browsh imagemagick superfile gnumake
		pandoc typst gnupg lynx ffmpeg-full texliveFull
		bitwarden-cli ocrmypdf
	]

	++ lib.optionals host.hasDesktop [ wl-clipboard ];

}
