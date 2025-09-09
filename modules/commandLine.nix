{ pkgs, host, ... }:

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
			enableSSHSupport = true;
		};
	};

	services.pcscd.enable = true;

	environment.systemPackages = with pkgs; [
		# Common CLIs
		ripgrep fastfetch onefetch tree gcc tree-sitter
		fastfetch fzf figlet zip unzip wget yt-dlp btop
		gh cmatrix browsh imagemagick superfile gnumake
		pandoc typst texliveFull bitwarden-cli gnupg
		ffmpeg-full
	]

	++ lib.optionals host.hasDesktop [ wl-clipboard ];

}
