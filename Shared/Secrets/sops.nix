{ inputs, userName, config, hasDesktop, lib, pkgs, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];
	environment.systemPackages = [ pkgs.ssh-to-age pkgs.sops ];

	sops = {
		defaultSopsFile = ./Secrets.yaml;
		defaultSopsFormat = "yaml";
		age = {
			keyFile = "/etc/sops/age/keys.txt";
			# Somehow does not provide the correct key.
			# You are better off just ssh-to-age'ing
			# the keys for yourself.

			sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
			generateKey = true;
		};
		validateSopsFiles = true;
		secrets = {
			"user/kian".neededForUsers = true;
			"user/root".neededForUsers = true;
			"user/user".neededForUsers = true;
			"services/paperless" = {
				owner = lib.mkIf (!hasDesktop)
					config.services.paperless.user;
			};
			"services/nextcloud" = {
				owner = lib.mkIf (!hasDesktop)
					config.services.nextcloud.config.dbuser;
			};
		};
	};

	system.activationScripts.exportAgeKey = ''
		mkdir -p ${config.users.users.${userName}.home}/.config/sops/age/
		$(cat /etc/ssh/ssh_host_ed25519_key.pub | ${pkgs.ssh-to-age}/bin/ssh-to-age) > ${config.users.users.${userName}.home}/.config/sops/age/keys.txt
	'';

}
