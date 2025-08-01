{ config, lib, ... }:

{

	# This is purely taken from the Wiki
	# I am going to work it out for my-
	# self as soon as possible.

	services.searx = {
		enable = false;
		redisCreateLocally = true;

		limiterSettings = {
			real_ip = {
				x_for = 1;
				ipv4_prefix = 32;
				ipv6_prefix = 56;
			};

			botdetection = {
				ip_limit = {
					filter_link_local = true;
					link_token = true;
				};
			};
		};

		configureUwsgi = true;
		uwsgiConfig = {
			socket = "/run/searx/searx.sock";
			http = ":8888";
			chmod-socket = "660";
		};

		settings = {
			general = {
				debug = false;
				instance_name = "SearXNG Instance";
				donation_url = false;
				contact_url = false;
				privacypolicy_url = false;
				enable_metrics = false;
			};

			ui = {
				static_use_hash = true;
				default_locale = "en";
				query_in_title = true;
				infinite_scroll = true;
				center_alignment = true;
				default_theme = "simple";
				theme_args.simple_style = "auto";
				search_on_category_select = false;
				hotkeys = "vim";
			};

			search = {
				safe_search = 2;
				autocomplete_min = 2;
				autocomplete = "duckduckgo";
				ban_time_on_fail = 5;
				max_ban_time_on_fail = 120;
			};

			server = {
				port = 8888;
				bind_address = "127.0.0.1";
				secret_key = config.sops.secrets."services/searx".path;
				limiter = true;
				public_instance = false;
				method = "GET";
			};

			engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
				"duckduckgo".disabled = true;
				"brave".disabled = true;
				"bing".disabled = true;
				"ddg definitions".disabled = true;
				"wikibooks".disabled = true;
				"wikidata".disabled = true;
				"wikiquote".disabled = true;
				"wikisource".disabled = true;
				"wikispecies".disabled = true;
				"wikiversity".disabled = true;
				"wikivoyage".disabled = true;
				"currency".disabled = true;
				"bing images".disabled = true;
				"brave.images".disabled = true;
				"duckduckgo images".disabled = true;
				"flickr".disabled = true;
				"imgur".disabled = true;
				"library of congress".disabled = true;
				"wallhaven".disabled = true;
				"wikicommons.images".disabled = true;
				"bing videos".disabled = true;
				"brave.videos".disabled = true;
				"duckduckgo videos".disabled = true;
				"dailymotion".disabled = true;
				"invidious".disabled = true;
				"youtube".disabled = true;
				"brave.news".disabled = true;
			};

			outgoing = {
				request_timeout = 5.0;
				max_request_timeout = 15.0;
				pool_connections = 100;
				pool_maxsize = 15;
				enable_http2 = true;
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

}
