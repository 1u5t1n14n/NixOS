{ pkgs, config, lib, ... }:

let
	cfg = config.services.kantOMat;

in
{

	config = lib.mkIf cfg.enable {
		nixpkgs.overlays = [
			(self: super: rec {
				kant-o-mat = super.callPackage ../modules/pkgs/kantOMat.nix {};
			})
		];

		services.nginx = {
			enable = true;
			virtualHosts.${cfg.hostName}.locations."/${cfg.subDirectory}" =  {
				root = "${pkgs.kant-o-mat}";
			};
		};
	};

	options.services.kantOMat = {
		enable = lib.mkEnableOption "Enable the mighty Kant-O-Mat.";

		hostName = lib.mkOption {
			type = lib.types.str;
			default = "localhost";
			description = "The host to listen on.";
		};

		subDirectory = lib.mkOption {
			type = lib.types.str;
			default = "kant-o-mat";
			description = ''
				This is the sub directory on the host that contains the
				Kant-O-Mat. When omitted it is served on the host '/' itself.

				Only input the part after the solidus.
			'';
		};
	};

}
