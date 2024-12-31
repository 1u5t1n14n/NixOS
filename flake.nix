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

	outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
	let
		system = "x86_64-linux";

		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

		userName = "1u5t1n14n";

		mkNixosConfig = { hostname, hasDesktop }:
			nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs userName;
					inherit hostname;
					inherit hasDesktop;
				};
				modules = [
					./configuration.nix
					./Hardware/${hostname}.nix
					home-manager.nixosModules.home-manager {
						home-manager.extraSpecialArgs = {
							inherit userName;
							inherit hostname;
							inherit hasDesktop;
						};
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${userName} = import ./home/home.nix;
						home-manager.backupFileExtension = "HMbackup";
					}
				];
			};
	in {
		nixosConfigurations = {
			Morpheus = mkNixosConfig { hostname = "Morpheus"; hasDesktop = true; };
			Hyperion = mkNixosConfig { hostname = "Hyperion"; hasDesktop = true; };
		};
	};
}
