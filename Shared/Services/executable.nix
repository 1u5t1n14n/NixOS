{ pkgs, hasDesktop, ... }:

{

	programs.appimage.enable = hasDesktop;

	programs.nix-ld = {
		enable = true;
		package = pkgs.nix-ld-rs;
		libraries = with pkgs; [ ];
	};

}
