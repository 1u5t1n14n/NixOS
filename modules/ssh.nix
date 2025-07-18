{ host, lib, ... }:

{

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
				]
				++ lib.optionals !host.hasDesktop [
					"kian"
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
