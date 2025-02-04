{ lib, BIOS, ... }:

{

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.loader.grub.device = lib.mkIf BIOS "/dev/sda";

}
