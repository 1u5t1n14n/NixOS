{ hasDesktop, lib, pkgs, inputs, ... }:

{

	imports = [
		./Shared/Secrets/sops.nix
		./Shared/Services/Services.nix
		./Shared/Programs/Programs.nix
	]
	++ lib.optionals hasDesktop [
		./Desktop/Services/Services.nix
		./Desktop/Programs/Programs.nix
	]
	++ lib.optionals (!hasDesktop) [
		./Server/Services/Services.nix
		./Server/Programs/Programs.nix
	];

	environment.systemPackages = [ pkgs.home-manager ];

}
