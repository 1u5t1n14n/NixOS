{ pkgs, hasDesktop, ... }:

{

	programs.appimage.enable = hasDesktop;

	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [ ];

}
