{ host, lib, config, ... }:

{

	users.users.${host.user}.openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEwFDVhbXfV9zM8iQurlgoCo0lpIMBuJ1R7TS+tcYT1"
	];

	services = {
		fail2ban.enable = true;
		openssh = {
			enable = true;

			# Should probably change default Port
			# due to Security Risks
			ports = [ 22 ];
			openFirewall = true;

			# Activate when not a Server
			startWhenNeeded = host.hasDesktop;
			settings = {
				PasswordAuthentication = true;
				PermitRootLogin = "no";
				AllowUsers = [
					host.user 
					config.users.users.kian.name
				];
			};

			banner = ''


				YOU SHALL NOT PASS!


			'';

			# Already default
			allowSFTP = true;
		};
	};

}
