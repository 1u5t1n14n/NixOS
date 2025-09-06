{ config, inputs, host, pkgs, ... }:

let
	cfg = config.services.nextcloud;

in
{

	sops.secrets."services/nextcloud".owner = cfg.config.dbuser;

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
			updatechecker = false;

			preview_libreoffice_path = "${pkgs.libreoffice-fresh}/bin/libreoffice";
			preview_ffmpeg_path = "${pkgs.ffmpeg-full}/bin/ffmpeg";

			# Should be 1 when Changing happens
			filesystem_check_changes = 0;

			defaultapp = "files";
			"simpleSignUpLink.shown" = false;
			login_form_autocomplete = false;

			default_phone_region = "DE";
			default_language = "de_DE";
			default_locale = "de";
			default_timezone = "Europe/Berlin";

			reduce_to_languages = [ "de" "de_DE" "en" ];

			trusted_domains = [
				cfg.hostName
				"192.168.178.178"
				host.name
			];
		};
	};

	networking.firewall.allowedTCPPorts = [ 80 443 ];

}
