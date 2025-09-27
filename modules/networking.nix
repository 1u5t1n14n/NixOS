{ host, ... }:

{

	networking = {
		hostName = host.name;

		nftables.enable = true;
		firewall.enable = true;

		networkmanager.enable = true;
	};

}
