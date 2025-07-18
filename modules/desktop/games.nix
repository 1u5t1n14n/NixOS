{ pkgs, ... }:

{

	programs = {
		steam = {
			enable = true;
			# Might try it out later
			# gamescopeSession.enable = true;
		};
		# gamemode.enable = true;
	};

	environment.systemPackages = [ pkgs.prismlauncher ];

	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
			extraPackages = with pkgs; [ intel-media-driver ];
		};
	};

}
