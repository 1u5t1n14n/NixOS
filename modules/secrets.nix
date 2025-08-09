{ host, config, lib, pkgs, ... }:

let
	user = config.users.users.${host.user};
	sshKeyFile = "/etc/ssh/ssh_host_ed25519_key";

in
{

	environment.systemPackages = [ pkgs.ssh-to-age pkgs.sops ];

	sops = {
		log = [ "secretChanges" ];
		defaultSopsFile = ../secrets.yaml;
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
				owner = lib.mkIf config.services.paperless.enable
					config.services.paperless.user;
			};
			"services/nextcloud" = {
				owner = lib.mkIf config.services.nextcloud.enable
					config.services.nextcloud.config.dbuser;
			};
			"services/send" = {
				owner = lib.mkIf config.services.send.enable
					null;
			};
			"services/searx" = {
				owner = lib.mkIf config.services.searx.enable
					"nginx";
			};
			"services/write" = {
				owner = lib.mkIf config.services.writefreely.enable
					config.services.writefreely.user;
			};
		};
	};

	system.activationScripts.copyToHomeDir = ''
		mkdir -p ${user.home}/.config/sops/age/
		${pkgs.ssh-to-age}/bin/ssh-to-age -private-key -i ${sshKeyFile} -o ${user.home}/.config/sops/age/keys.txt
		chown -R ${host.user}:${user.group} ${user.home}/.config/sops/
	'';

}
