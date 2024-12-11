{ config, pkgs, ... }:

{

	networking.interfaces.wlp4s0.wakeOnLan = {
		enable = true;
	};

}
