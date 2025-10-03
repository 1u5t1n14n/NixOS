{ host, config, ... }:

{

	networking = {
		hostName = host.name;

		firewall.enable = true;
		nftables.enable = config.networking.firewall.enable;

		networkmanager.enable = true;
	};

}
