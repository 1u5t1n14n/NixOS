{ inputs, userName, config, hasDesktop, lib, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];

	sops = {
		defaultSopsFile = ./Secrets.yaml;
		defaultSopsFormat = "yaml";
		age = {
			keyFile = "/etc/sops/age/key.txt";
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

}
