{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nur.url = "github:nix-community/NUR";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
	let
		system = "x86_64-linux";

		pkgs = nixpkgs.legacyPackages.${system};

		userName = "1u5t1n14n";

		mkNixosConfig = { hostName, hasDesktop, BIOS }:
			nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
					inherit userName;
					inherit hostName;
					inherit hasDesktop;
					inherit nixvim;
					inherit BIOS;
				};
				modules = [
					nixvim.nixosModules.nixvim
					./Configuration.nix
					./Hardware/${hostName}.nix
					home-manager.nixosModules.home-manager {
						home-manager.extraSpecialArgs = {
							inherit userName;
							inherit hostName;
							inherit hasDesktop;
						};
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${userName} = import ./Home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
	in {
		nixosConfigurations = {
			Prometheus = mkNixosConfig { hostName = "Prometheus"; hasDesktop = false; BIOS = true; };
			Morpheus = mkNixosConfig { hostName = "Morpheus"; hasDesktop = true; BIOS = false; };
			Hyperion = mkNixosConfig { hostName = "Hyperion"; hasDesktop = true; BIOS = false; };
		};
	};
}
