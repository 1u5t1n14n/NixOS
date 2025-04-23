{ inputs, userName, config, hasDesktop, lib, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];

	sops = {
		defaultSopsFile = ./Secrets.yaml;
		defaultSopsFormat = "yaml";
		age = {
			keyFile = "/etc/sops/age/keys.txt";
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

	system.activationScripts.copyToHomeDir = ''
		mkdir -p ${config.users.users.${userName}.home}/.config/sops/age/keys.txt
		if [ ! -f "${config.sops.age.keyFile}" ]; then
			cp ${config.sops.age.keyFile} ${config.users.users.${userName}.home}/.config/sops/age/keys.txt
		fi
		chown -R ${userName}:users ${config.users.users.${userName}.home}/.config/sops/age/keys.txt
	'';

}
