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

	in
		let
			makeConfiguration = hostname: nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs pkgs pkgs-stable userName; };
				modules = [
					./configuration.nix
					./Hardware/${hostname}.nix
					home-manager.nixosModules.home-manager {
						home-manager = {
							home-manager.extraSpecialArgs = {
								inherit userName;
								hostName = "${hostname}";
							};
							useGlobalPkgs = true;
							useUserPackages = true;
							users.${userName} = import ./home/home.nix;
							backupFileExtension = "HMbackup";
							};
					}
				];
			};
		in {
			nixosConfigurations = {
				Morpheus = makeConfiguration "Morpheus";
				Hyperion = makeConfiguration "Hyperion";
			};
		};
	}
