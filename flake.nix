{

	description = ''
		A very basic flake.
	'';

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		homeManager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixVim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		sops.url = "github:Mic92/sops-nix";

		ags.url = "github:aylur/ags";
		walker.url = "github:abenz1267/walker";
	};

	outputs = { self, nixpkgs, ... }@inputs:
	let

		mkNixosConfig = { host }:
			nixpkgs.lib.nixosSystem {
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

								inputs.ags.homeManagerModules.default
								inputs.walker.homeManagerModules.default
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
					user = "1u5t1n14n";
					hasDesktop = false;
				};
			};

			Hyperion = mkNixosConfig {
				host = {
					name = "Hyperion";
					user = "1u5t1n14n";
					hasDesktop = true;
					terminal = "wezterm";
				};
			};

			Morpheus = mkNixosConfig {
				host = {
					name = "Morpheus";
					user = "1u5t1n14n";
					hasDesktop = true;
					terminal = "wezterm";
				};
			};
		};

	};

}
