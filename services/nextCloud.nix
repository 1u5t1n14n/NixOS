{ config, inputs, host, pkgs, ... }:

let
	cfg = config.services.nextcloud;

in
{

	# One could also enable an Object Store
	# When there is time.

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = pkgs.nextcloud30;
		# package = inputs.nixpkgStable.legacyPackages.${host.system}.nextcloud29;

		configureRedis = true;
		phpOptions."opcache.interned_strings_buffer" = 128;

		# App Installation
		extraAppsEnable = true;
		autoUpdateApps.enable = cfg.extraAppsEnable;
		extraApps = with cfg.package.packages.apps; {
			inherit calendar contacts mail cookbook maps richdocuments;
			#                                            ^^ Office App
		};

		database.createLocally = true;
		config = {
			dbtype = "pgsql";
			dbuser = "nextcloud";
			adminuser = "root";
			adminpassFile = config.sops.secrets."services/nextcloud".path;
		};

		settings = {
			maintenance_window_start = 1;
			default_phone_region = "DE";
			trusted_domains = [
				cfg.hostName
				"192.168.178.178"
				host.name
			];
		};
	};

}
