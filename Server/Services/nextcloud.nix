{ config, inputs, system, hostName, ... }:

{

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = inputs.nixpkgsStable.legacyPackages."${system}".nextcloud30;

		database.createLocally = true;
		configureRedis = true;

		autoUpdateApps.enable = true;
		extraAppsEnable = true;
		extraApps = with config.services.nextcloud.package.packages.apps; {
			inherit calendar contacts notes tasks mail cookbook music maps registration bookmarks;
		};

		config = {
			dbtype = "pgsql";
			dbuser = "nextcloud";
			adminuser = "root";

			# TODO -> agenix
			adminpassFile = "/etc/nextcloudRoot";
		};

		settings.default_phone_region = "DE";
		settings.trusted_domains = [
				"localhost"
				"192.168.178.178"
				"${hostName}"
		];
	};

	users.groups.cloudaccess = {};
	users.users.nextcloud.extraGroups = [ "cloudaccess" ];

	# TODO -> agenix
	environment.etc."nextcloudRoot".text = "goodPassword';:2";

}
