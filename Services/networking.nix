{ config, pkgs, hostname, hasDesktop, ... }:

{
	networking = {
		hostName = "${hostname}";
		networkmanager.enable = true;
		firewall.enable = true;
		firewall.allowedTCPPorts = [ 22 3389 ];
		firewall.allowedUDPPorts = [ 3389 ];
	};

	services.openssh = {
		enable = true;
		settings.X11Forwarding = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = true;
			PermitRootLogin = "no";
		};
	};

	programs.ssh.setXAuthLocation = config.services.openssh.settings.X11Forwarding;

	environment.systemPackages = with pkgs; [
		xorg.xauth
		ethtool
		iw
	];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = config.services.openssh.enable;
	};

	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
