{ config, ... }:

let
	cfg = config.services.searx;

in
{

	services.searx = {
		enable = true;
		redisCreateLocally = true;

		environmentFile = config.sops.templates.searx.path;

		settings = {
			general = {
				debug = false;
				enable_metrics = false;
			};

			server = {
				bind_address = "0.0.0.0";
				port = 8888;
				public_instance = false;
			};

			search = {
				autocomplete = "duckduckgo";
			};

			enabled_plugins = [
				"Basic Calculator"
				"Hash plugin"
				"Tor check plugin"
				"Open Access DOI rewrite"
				"Unit converter plugin"
				"Tracker URL remover"
			];
		};
	};

	sops.templates.searx.content = ''
		SEARXNG_SECRET=${config.sops.placeholder."services/searx"}
	'';

	networking.firewall.allowedTCPPorts = [ cfg.settings.server.port ];

}
