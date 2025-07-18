{ config, host, pkgs, lib, ... }:

{

	imports = [
		./modules
	]
	++ lib.optionals host.hasDesktop [
		./modules/desktop
	]
	++ lib.optionals (!host.hasDesktop) [
		./services
	];

	environment.systemPackages = [ pkgs.home-manager ];

	system.activationScripts.homeManagerRemove = ''
		find ${config.users.users.${host.user}.home} -type f -name "*.hmBackup" -delete
	'';

}
