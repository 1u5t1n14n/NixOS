{

	description = ''
		A very basic flake.
	'';

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgStable.url = "nixpkgs/nixos-25.05";
		homeManager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixVim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops.url = "github:Mic92/sops-nix";
	};

	outputs = { self, nixpkgs, ... }@inputs:
	let

		mkNixosConfig = { host }:
			nixpkgs.lib.nixosSystem {
				system = host.system;
				specialArgs = { inherit host; inherit inputs; };
				modules = [
					./configuration.nix
					./modules/hardware/${host.name}.nix

					inputs.sops.nixosModules.sops
					inputs.homeManager.nixosModules.home-manager
					{
						home-manager = {
							extraSpecialArgs = {
								inherit host;
								inherit inputs;
							};

							backupFileExtension = "hmBackup";

							useUserPackages = false;
							useGlobalPkgs = true;
							users.${host.user}.imports = [
								./home/home.nix
								inputs.nixVim.homeModules.nixvim
							];
						};
					}
				];
			};

	in
	{

		nixosConfigurations = {
			Prometheus = mkNixosConfig {
				host = {
					name = "Prometheus";
					system = "x86_64-linux";
					user = "1u5t1n14n";
					hasDesktop = false;
				};
			};

			Hyperion = mkNixosConfig {
				host = {
					name = "Hyperion";
					system = "x86_64-linux";
					user = "1u5t1n14n";
					hasDesktop = true;
					terminal = "wezterm";
				};
			};

			Morpheus = mkNixosConfig {
				host = {
					name = "Morpheus";
					system = "x86_64-linux";
					user = "1u5t1n14n";
					hasDesktop = true;
					terminal = "wezterm";
				};
			};
		};

	};

}
