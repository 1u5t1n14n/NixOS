{ inputs, system, ... }:

{

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = inputs.nixpkgsStable.legacyPackages."${system}".nextcloud27

		database.createLocally = true;
		configureRedis = true;

		autoUpdateApps.enable = true;
		extraAppsEnable = true;
		extraApps = with config.services.nextcloud.package.packages.apps; {
			inherit calendar contacts notes tasks;
		};

		config = {
			dbtype = "pgsql";
			adminuser = "root";
			adminpassFile = "/etc/nextcloudRoot";
		};
	};

	environment.etc."nextcloudRoot" = "goodPassword";

}
