{ config, inputs, host, ... }:

let
	cfg = config.services.nextcloud;

in
{

	# One could also enable an Object Store
	# When there is time.

	services.nextcloud = {
		enable = true;
		hostName = "localhost";

		package = inputs.nixpkgStable.legacyPackages.${system}.nextcloud30;

		configureRedis = true;
		phpOptions."opcache.interned_strings_buffer" = 128;

		# App Installation
		extraAppsEnable = true;
		autoUpdateApps.enable = cfg.extraAppsEnable;
		extraApps = with cfg.package.packages.apps; {
			inherit calendar contacts mail cookbook maps richdocuments;
			#												^^ Office App
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

	# Theming of Nextcloud via a Service
	systemd.services.nextcloud-custom-config = {
		path = [
			config.services.nextcloud.occ
		];
		script = ''
			# For now these are only taken from
			# The Wiki Article. Will theme it
			# Later.

			# nextcloud-occ theming:config name "My Cloud"
			# nextcloud-occ theming:config url "https://cloud.mine.com";
			# nextcloud-occ theming:config privacyUrl "https://www.mine.com/privacy";
			# nextcloud-occ theming:config color "#3253a5";
			# nextcloud-occ theming:config logo ${./logo.png}
		'';
		after = [ "nextcloud-setup.service" ];
		wantedBy = [ "multi-user.target" ];
	};

}
