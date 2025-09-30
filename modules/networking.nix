{ host, config, ... }:

{

	networking = {
		hostName = host.name;

		nftables.enable = config.networking.firewall.enable;
		firewall.enable = true;

		networkmanager.enable = true;
	};

}
