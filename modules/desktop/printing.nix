{ pkgs, host, ... }:

{

	services = {
		printing = {
			enable = host.hasDesktop;
			drivers = with pkgs; [ ];
			cups-pdf.enable = true;
		};

		avahi = {
			enable = host.hasDesktop;
			nssmdns4 = true;
			openFirewall = true;
		};
	};

}
