{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		let
		system = "86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.Morpheus = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
				./configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users."1u5t1n14n" = import ./home/home.nix;
						home-manager.backupFileExtension = "back";
					}
			];
		};
	};
}
