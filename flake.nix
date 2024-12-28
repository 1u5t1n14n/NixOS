{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

		zen-browser.url = "github:0xc000022070/zen-browser-flake";

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
		system = "x86_64-linux";

		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

		userName = "1u5t1n14n";
	in {
		nixosConfigurations = {
			Morpheus = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs userName;
					hostname = "Morpheus";
				};
				modules = [
					./configuration.nix
					./Hardware/Morpheus.nix
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${userName} = import ./home/home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
			Hyperion = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs userName;
					hostname = "Hyperion";
				};
				modules = [
					./configuration.nix
					./Hardware/Hyperion.nix
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${userName} = import ./home/home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
		};
	};
}
