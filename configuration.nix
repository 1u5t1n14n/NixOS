{ config, pkgs, ... }:

{

	imports = [
		/etc/nixos/hardware-configuration.nix
		./programs/pkgs.nix
		./settings/nix.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	system.stateVersion = "24.11";

}
