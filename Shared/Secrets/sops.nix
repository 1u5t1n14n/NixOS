{ inputs, userName, config, hasDesktop, lib, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];

	sops.defaultSopsFile = ./Secrets.yaml;
	sops.defaultSopsFormat = "yaml";

	#sops.age.keyFile = "/etc/sops/age/key.txt";
	sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
	sops.age.generateKey = true;

	sops.validateSopsFiles = true;
	filesystems."/etc/ssh".neededForBoot = true;

	sops.secrets."user/kian" = {
		neededForUsers = true;
	};
	sops.secrets."user/root" = {
		neededForUsers = true;
	};
	sops.secrets."user/user" = {
		neededForUsers = true;
	};
	sops.secrets."services/paperless" = {
		owner = lib.mkIf (!hasDesktop)
		config.services.paperless.user;
	};
	sops.secrets."services/nextcloud" = {
		owner = lib.mkIf (!hasDesktop)
		config.services.nextcloud.config.dbuser;
	};

}
