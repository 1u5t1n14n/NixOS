{ pkgs, ... }:

{

	nixpkgs.overlays = [
		(self: super: rec {
			kant-o-mat = super.callPackage ../modules/packages/Kant-O-Mat.nix {};
		})
	];

	services.nginx = {
		enable = true;
		virtualHosts.localhost.locations."/kant-o-mat" = {
			root = "${pkgs.kant-o-mat}";
		};
	};

}
