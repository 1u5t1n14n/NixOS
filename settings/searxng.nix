{ pkgs, lib, ... }:

{

	services.nginx = {
		enable = true;
		recommendedProxySettings = true;
		virtualHosts."localhost" = {
			locations."/" = {
				proxyPass = "http://127.0.0.1:8080";
			};
		};
	};

	services.searx = {
		enable = true;
		redisCreateLocally = true;
		settings = {
			server = {
				secret_key = "your_secret_key_here";
				port = 8080;
				bind_address = "127.0.0.1";
			};
			search = {
				safe_search = 0;
				autocomplete = "duckduckgo";
			};
			ui = {
				default_locale = "de";
				query_in_title = true;
				infinite_scroll = true;
				hotkeys = "vim";
				default_theme = "simple";
			};
			engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
				"1x".disabled = true;
				"artic".disabled = false;
				"bing images".disabled = false;
				"bing videos".disabled = false;
				"bing".disabled = false;
				"brave".disabled = false;
				"brave.images".disabled = false;
				"brave.news".disabled = true;
				"brave.videos".disabled = true;
				"crowdview".disabled = false;
				"crowdview".weight = 0.5;
				"curlie".disabled = true;
				"currency".disabled = false;
				"dailymotion".disabled = true;
				"ddg definitions".disabled = false;
				"ddg definitions".weight = 2;
				"deviantart".disabled = false;
				"dictzone".disabled = true;
				"duckduckgo images".disabled = false;
				"duckduckgo videos".disabled = true;
				"duckduckgo".disabled = false;
				"flickr".disabled = true;
				"google images".disabled = false;
				"google news".disabled = true;
				"google play movies".disabled = true;
				"google videos".disabled = false;
				"imgur".disabled = false;
				"invidious".disabled = true;
				"library of congress".disabled = false;
				"lingva".disabled = false;
				"material icons".disabled = true;
				"material icons".weight = 0.2;
				"mojeek".disabled = false;
				"mwmbl".disabled = false;
				"mwmbl".weight = 0.4;
				"odysee".disabled = true;
				"openverse".disabled = false;
				"peertube".disabled = false;
				"pinterest".disabled = true;
				"piped".disabled = true;
				"qwant images".disabled = false;
				"qwant videos".disabled = false;
				"qwant".disabled = false;
				"rumble".disabled = false;
				"sepiasearch".disabled = false;
				"svgrepo".disabled = false;
				"unsplash".disabled = false;
				"vimeo".disabled = true;
				"wallhaven".disabled = false;
				"wikibooks".disabled = false;
				"wikicommons.images".disabled = false;
				"wikidata".disabled = false;
				"wikiquote".disabled = true;
				"wikisource".disabled = true;
				"wikispecies".disabled = false;
				"wikispecies".weight = 0.5;
				"wikiversity".disabled = false;
				"wikiversity".weight = 0.5;
				"wikivoyage".disabled = false;
				"wikivoyage".weight = 0.5;
				"yacy images".disabled = true;
				"youtube".disabled = false;
			};
			enabled_plugins = [
				"Hash plugin"
				"Basic Calculator"
				"Tor check plugin"
				"Open Access DOI rewrite"
				"Self Information"
				"Tracker URL remover"
				"Unit converter plugin"
			];
		};
	};

}
