{ ... }:

{

        services.searx = {
                enable = true;
                redisCreateLocally = true;
                settings = {
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

                        enabled_plugins = [
                                "Basic Calculator"
                                "Hash plugin"
                                "Tor check plugin"
                                "Open Access DOI rewrite"
                                "Hostnames plugin"
                                "Unit converter plugin"
                                "Tracker URL remover"
                        ];

                        server = {
                                port = 8888;
                                bind_address = "0.0.0.0";
                                secret_key = "";
                        };
                };
        };

        networking.firewall.allowedTCPPorts = [ 8888 ];

}
