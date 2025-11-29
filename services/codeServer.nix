{ config, ... }:

{

	services.code-server = {
		enable = true;

		host = "0.0.0.0";
		port = 4444;

		user = "nathanderweise";
		group = config.users.users.nathanderweise.group;

		hashedPassword = "$argon2i$v=19$m=4096,t=3,p=1$VkFLYi9kaFdENlZxVXVKSTlic1VCUlhtL2s0PQ$JY142GStOww1U9sXL7mq881em/GDX9cpFApP3nhIle8";
		disableTelemetry = true;
	};

	users.users.nathanderweise = {
		isNormalUser = true;
		home = "/var/lib/nathanderweise";
		createHome = true;
		extraGroups = [ ];
		description = "Nathan der Weise";
		shell = pkgs.zsh;
		packages = with pkgs; [ ];
	};

}
