{ host, config, lib, ... }:

let
	cfg = config.services.openssh;

in
{

	users.users.${host.user}.openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEwFDVhbXfV9zM8iQurlgoCo0lpIMBuJ1R7TS+tcYT1 user@Termius"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFP9kyiHSaLuGocie+qs2a5jXRRzsOpruo2P+Bq5j4fS user@Hyperion"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINduKkKYcK2ef0B7n63abU009TjGYdVC+Oqmtbsdflks user@Prometheus"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJHcp2AjNY9/YQOnOsC40WZE79/9z+whkatioUMfImg+ user@Morpheus"
	];

	services = {
		fail2ban.enable = cfg.enable;
		endlessh = {
			enable = cfg.enable;
			port = 22;
			openFirewall = true;
		};

		openssh = {
			enable = true;

			ports = [ 20001 ];
			openFirewall = true;

			startWhenNeeded = host.hasDesktop;
			settings = {
				PasswordAuthentication = false;
				KbdInteractiveAuthentication = false;
				PermitRootLogin = "no";
				AllowUsers = [ host.user ]

				++ lib.optionals (!host.hasDesktop) [ config.users.users.kian.description ];
			};

			allowSFTP = config.services.openssh.settings.PasswordAuthentication;
		};
	};

}
