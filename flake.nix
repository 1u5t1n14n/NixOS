{

	description = ''
		A very basic flake.
	'';

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-24.11";
		agenix.url = "github:ryantm/agenix";
		homeManager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixVim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, homeManager, ...}@inputs:
	let
		userName = "1u5t1n14n";
		system = "x86_64-linux";

		mkNixosConfig = { hostName, hasDesktop }:
			nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
					inherit system;
					inherit userName;
					inherit hostName;
					inherit hasDesktop;
				};
				modules = [
					./Configuration.nix
					./Shared/Hardware/${hostName}.nix

					inputs.agenix.nixosModules.default
				];
			};

	in {
		nixosConfigurations = {
			Prometheus = mkNixosConfig {
				hostName = "Prometheus";
				hasDesktop = false;
			};
			Hyperion = mkNixosConfig {
				hostName = "Hyperion";
				hasDesktop = true;
			};
			Morpheus = mkNixosConfig {
				hostName = "Morpheus";
				hasDesktop = true;
			};
		};

		homeConfigurations."${userName}" = homeManager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages."${system}";
			extraSpecialArgs = {
				inherit userName;
			};
			modules = [ ./Home.nix ];
		};
	};

}
