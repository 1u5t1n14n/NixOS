{ pkgs, ... }:

{

	services = {
		printing = {
			enable = true;
			drivers = with pkgs; [ ];
			cups-pdf.enable = true;
		};

		avahi = {
			enable = true;
			nssmdns4 = true;
			openFirewall = true;
		};
	};

}
