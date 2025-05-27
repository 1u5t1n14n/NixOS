{ inputs, userName, config, hasDesktop, lib, pkgs, ... }:

let
	user = config.users.users.${userName};
	sshKeyFile = "/etc/ssh/ssh_host_ed25519_key";

in {

	imports = [ inputs.sops.nixosModules.sops ];
	environment.systemPackages = [ pkgs.ssh-to-age pkgs.sops ];

	sops = {
		log = [ "secretChanges" ];
		defaultSopsFile = ./Secrets.yaml;
		defaultSopsFormat = "yaml";
		age = {
			keyFile = "/etc/sops/age/keys.txt";
			sshKeyPaths = [ sshKeyFile ];
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
		mkdir -p ${user.home}/.config/sops/age/
		${pkgs.ssh-to-age}/bin/ssh-to-age -private-key -i ${sshKeyFile} -o ${user.home}/.config/sops/age/keys.txt
		chown -R ${userName}:${user.group} ${user.home}/.config/sops/
	'';

}
