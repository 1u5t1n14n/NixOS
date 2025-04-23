{ inputs, userName, config, ... }:

{

	imports = [ inputs.sops.nixosModules.sops ];

	sops.defaultSopsFile = ./Secrets.yaml;
	sops.defaultSopsFormat = "yaml";

	sops.age.keyFile = "${config.users.users."${userName}".home}/.config/sops/age/keys.txt";

	sops.secrets."user/kian" = { };
	sops.secrets."user/root" = { };
	sops.secrets."user/user" = { };

}
