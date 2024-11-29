{ config, pkgs, lib, ... }:

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
        "duckduckgo".disabled = true;
        "brave".disabled = true;
        "bing".disabled = false;
        "mojeek".disabled = true;
        "mwmbl".disabled = false;
        "mwmbl".weight = 0.4;
        "qwant".disabled = true;
        "crowdview".disabled = false;
        "crowdview".weight = 0.5;
        "curlie".disabled = true;
        "ddg definitions".disabled = false;
        "ddg definitions".weight = 2;
        "wikibooks".disabled = false;
        "wikidata".disabled = false;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = false;
        "wikispecies".weight = 0.5;
        "wikiversity".disabled = false;
        "wikiversity".weight = 0.5;
        "wikivoyage".disabled = false;
        "wikivoyage".weight = 0.5;
        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;
        "bing images".disabled = false;
        "brave.images".disabled = true;
        "duckduckgo images".disabled = true;
        "google images".disabled = false;
        "qwant images".disabled = true;
        "1x".disabled = true;
        "artic".disabled = false;
        "deviantart".disabled = false;
        "flickr".disabled = true;
        "imgur".disabled = false;
        "library of congress".disabled = false;
        "material icons".disabled = true;
        "material icons".weight = 0.2;
        "openverse".disabled = false;
        "pinterest".disabled = true;
        "svgrepo".disabled = false;
        "unsplash".disabled = false;
        "wallhaven".disabled = false;
        "wikicommons.images".disabled = false;
        "yacy images".disabled = true;
        "bing videos".disabled = false;
        "brave.videos".disabled = true;
        "duckduckgo videos".disabled = true;
        "google videos".disabled = false;
        "qwant videos".disabled = false;
        "dailymotion".disabled = true;
        "google play movies".disabled = true;
        "invidious".disabled = true;
        "odysee".disabled = true;
        "peertube".disabled = false;
        "piped".disabled = true;
        "rumble".disabled = false;
        "sepiasearch".disabled = false;
        "vimeo".disabled = true;
        "youtube".disabled = false;
        "brave.news".disabled = true;
        "google news".disabled = true;
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
