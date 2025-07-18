{ host, ... }:

{

	networking = {
		hostName = host.name;
		firewall.enable = true;

		# Already enabled if using GNOME
		networkmanager.enable = true;
	};

}
