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
		openssh = {
			enable = true;

			ports = [ 20001 ];
			openFirewall = true;

			startWhenNeeded = host.hasDesktop;
			settings = {
				PasswordAuthentication = false;
				KbdInteractiveAuthentication = false;
				PermitRootLogin = "no";
				AllowUsers = [ host.user ];
			};

			allowSFTP = config.services.openssh.settings.PasswordAuthentication;
		};

		fail2ban = {
			enable = cfg.enable;
			maxretry = 5;
			bantime = "2h";

			bantime-increment = {
				enable = true;
				multipliers = "1 2 4 8 16 32 64 128 256";
				maxtime = "168h";
				overalljails = true;
			};
		};
		endlessh = {
			enable = cfg.enable;
			port = 22;
			openFirewall = true;
		};
	};

	programs.ssh.extraConfig = ''
		Host server
			HostName Prometheus
			Port 20001
			User ${host.user}
	'';

}
