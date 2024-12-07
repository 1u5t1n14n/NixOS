{ config, pkgs, ... }:

{
	networking = {
		hostName = "Morpheus";
		networkmanager.enable = true;
		firewall.enable = true;
		firewall.allowedTCPPorts = [ 22 3389 ];
		firewall.allowedUDPPorts = [ 3389 ];
	};

	services.gnome.gnome-remote-desktop.enable = true;

	services.openssh = {
		enable = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = true;
			PermitRootLogin = "no";
		};
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = false;
	};

	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
