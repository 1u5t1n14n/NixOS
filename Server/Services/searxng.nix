{ config, lib, ... }:

let
	searxng = config.services.searx;

in {

        services.searx = {
                enable = true;
                redisCreateLocally = true;
                settings = {
                        server = {
                                port = 8888;
                                bind_address = "0.0.0.0";
                                secret_key = "";
								public_instance = false;
                        };
                        general = {
                                debug = false;
                                instance_name = "SearXNG";
                                donation_url = false;
                                contact_url = false;
                                privacypolicy_url = false;
                                enable_metrics = false;
                        };
                        ui = {
                                static_use_hash = true;
                                default_locale = "de";
                                query_in_title = true;
                                infinite_scroll = true;
                                center_alignment = false;
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
						engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
							"duckduckgo".disabled = false;
							"bing".disabled = false;
							"mwmbl".disabled = false;
							"crowdview".disabled = false;
							"ddg definitions".disabled = false;
							"ddg definitions".weight = 2;
							"wikibooks".disabled = false;
							"wikidata".disabled = false;
							"wikiquote".disabled = false;
							"wikisource".disabled = false;
							"wikispecies".disabled = false;
							"wikispecies".weight = 0.5;
							"wikiversity".disabled = false;
							"wikiversity".weight = 0.5;
							"wikivoyage".disabled = false;
							"wikivoyage".weight = 2;
							"currency".disabled = false;
							"dictzone".disabled = false;
							"bing images".disabled = false;
							"brave.images".disabled = false;
							"duckduckgo images".disabled = false;
							"google images".disabled = false;
							"artic".disabled = false;
							"deviantart".disabled = false;
							"imgur".disabled = false;
							"library of congress".disabled = false;
							"material icons".disabled = false;
							"openverse".disabled = false;
							"svgrepo".disabled = false;
							"unsplash".disabled = false;
							"wallhaven".disabled = false;
							"wikicommons.images".disabled = false;
							"bing videos".disabled = false;
							"duckduckgo videos".disabled = false;
							"google videos".disabled = false;
							"qwant videos".disabled = false;
							"dailymotion".disabled = false;
							"invidious".disabled = false;
							"rumble".disabled = false;
							"youtube".disabled = false;
						};
                        enabled_plugins = [
                                "Basic Calculator"
                                "Hash plugin"
                                "Open Access DOI rewrite"
                                "Unit converter plugin"
                                "Tracker URL remover"
                        ];
                };
        };

        networking.firewall.allowedTCPPorts = [ searxng.settings.server.port ];

}
