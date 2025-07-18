{ config, inputs, host, pkgs, ... }:

let
	cfg = config.services.nextcloud;

in
{

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = pkgs.nextcloud31;

		configureRedis = true;
		phpOptions."opcache.interned_strings_buffer" = 16;

		# App Installation
		extraAppsEnable = true;
		autoUpdateApps.enable = cfg.extraAppsEnable;
		extraApps = with cfg.package.packages.apps; {
			inherit calendar contacts mail cookbook maps;
		};

		nginx = {
			hstsMaxAge = 15552000;
			recommendedHttpHeaders = true;
		};

		database.createLocally = true;
		config = {
			dbtype = "pgsql";
			dbuser = "nextcloud";
			adminuser = "root";
			adminpassFile = config.sops.secrets."services/nextcloud".path;
		};

		maxUploadSize = "1G";

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

	networking.firewall.allowedTCPPorts = [ 80 443 ];

}
