{

	description = ''
		A very basic flake.
	'';

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		firefox = {
			url = "github:nix-community/flake-firefox-nightly";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		agenix.url = "github:ryantm/agenix";
		nixVim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ...}@inputs:
	let
		userName = "1u5t1n14n";

		mkNixosConfig = { hostName, hasDesktop, system }:
			nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
					inherit userName;
					inherit hostName;
					inherit hasDesktop;
					inherit system;
				};
				modules = [
					./Configuration.nix
					./Hardware/${hostName}.nix

					inputs.agenix.nixosModules.default
				];
			};
	in {
		nixosConfigurations = {
			Morpheus = mkNixosConfig {
				hostName = "Morpheus";
				hasDesktop = true;
				system = "x86_64-linux";
			};
		};
	};

}
