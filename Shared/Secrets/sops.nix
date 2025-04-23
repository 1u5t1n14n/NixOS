{ inputs, userName, config, hasDesktop, lib, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];

	sops.defaultSopsFile = ./Secrets.yaml;
	sops.defaultSopsFormat = "yaml";

	sops.age.keyFile = "${config.users.users."${userName}".home}/.config/sops/age/keys.txt";

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
