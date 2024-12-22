{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, ... }@inputs:
	let
		system = "86_64-linux";

		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

		mainUser = "1u5t1n14n";
	in {
		nixosConfigurations = {
			Morpheus = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
				};
				modules = [
					./configuration.nix
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${mainUser} = import ./home/home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
			Hyperion = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
				};
				modules = [
					./configuration.nix
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${mainUser} = import ./home/home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
		};
	};
}
