{ config, inputs, system, hostName, userName, ... }:

{

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = inputs.nixpkgsStable.legacyPackages."${system}".nextcloud30;

		database.createLocally = true;
		configureRedis = true;

		phpOptions."opchache.interned_strings_buffer" = 128;

		autoUpdateApps.enable = true;
		extraAppsEnable = true;
		extraApps = with config.services.nextcloud.package.packages.apps; {
			inherit calendar contacts tasks mail cookbook maps;
		};

		nginx = {
			hstsMaxAge = 15552000;
			recommendedHttpHeaders = true;
		};

		config = {
			dbtype = "pgsql";
			dbuser = "nextcloud";
			adminuser = "root";
			adminpassFile = "/etc/nextcloudRoot";
		};

		settings = {
			maintenance_window_start = 1;
			default_phone_region = "DE";
			trusted_domains = [
				"localhost"
				"192.168.178.178"
				"${hostName}"
			];
		};
	};

	environment.etc."nextcloudRoot".text = "${builtins.getEnv "NEXTCLOUD"}";

	users.users.opendir = {
		home = "/var/lib/openDir";
		createHome = true;
		homeMode = "777";
		description = "Open Directory for all to use";
		group = "opendir";
		isSystemUser = true;
	};
	users.groups.opendir = {};

}
