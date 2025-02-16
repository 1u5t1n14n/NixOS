{ pkgs, ... }:

{

	services.xserver = {
		enable = true;
		excludePackages = with pkgs; [ xterm ];
		xkb = {
			layout = "de";
			variant = "";
		};
	};

}
