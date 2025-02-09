{ ... }:

{

	services.syncthing.guiAddress = "0.0.0.0:8384";

	networking.firewall = {
		allowedTCPPorts = [ 8384 22000 ];
		allowedUDPPorts = [ 22000 21027 ];
	};

}
