{ ... }:

{

	boot = {
		kernelParams = [ "quiet" "random.trust_cpu=off" ];
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};

}
