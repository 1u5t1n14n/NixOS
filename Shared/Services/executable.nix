{ pkgs, hasDesktop, ... }:

{

	programs.appimage = {
		enable = hasDesktop;
		binfmt = hasDesktop;
	};

	programs.nix-ld = {
		enable = true;
		package = pkgs.nix-ld-rs;
		libraries = with pkgs; [ ];
	};

}
