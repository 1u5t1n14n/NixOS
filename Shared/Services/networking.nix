{ pkgs, hostName, ... }:

{

	networking = {
		hostName = "${hostName}";
		networkmanager.enable = true;
		firewall.enable = true;
		firewall.allowedTCPPorts = [ 22 ];
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

	programs.ssh.setXAuthLocation = true;

	environment.systemPackages = with pkgs; [
		xorg.xauth
		ethtool
		iw
	];

}
