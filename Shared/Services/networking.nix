{ pkgs, hostName, ... }:

{

	networking = {
		hostName = "${hostName}";
		networkmanager.enable = true;
		nameservers = [ "8.8.8.8" "8.8.4.4" ];
		firewall.enable = true;
		firewall.allowedTCPPorts = [ 22 ];
	};

	services.openssh = {
		enable = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = true;
			PermitRootLogin = "no";
			X11Forwarding = true;
		};
	};

	programs.ssh.setXAuthLocation = true;

	environment.systemPackages = with pkgs; [
		xorg.xauth
		ethtool
		iw
	];

}
