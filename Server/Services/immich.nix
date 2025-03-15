{ system, inputs, ... }:

{

	services.immich = {
		enable = true;
		port = 2283;
		openFirewall = true;
		host = "0.0.0.0";
		package = inputs.nixpkgsStable.legacyPackages."${system}".immich;
	};

}
