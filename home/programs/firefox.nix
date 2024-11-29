{ config, pkgs, ... }:

{

  programs.firefox.enable = true;
  programs.firefox.profiles.Firefox = {
    name = "Firefox";
    isDefault = true;
    id = 0;
    containers = {
      personal = {
        name = "Personal";
        color = "purple";
        icon = "fingerprint";
        id = 1;
      };
      educational = {
        name = "Educational";
        color = "green";
        icon = "tree";
        id = 2;
      };
    };
    search = {
      force = true;
      default = "SearXNG";
      engines = {
        "Google".metaData.alias = "@g";
        "NixOS Wiki" = {
          urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
          iconUpdateURL = "https://search.nixos.org/images/nix-logo.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@nw" ];
        };
        "Reverse Dictionary" = {
          urls = [{ template = "https://www.onelook.com/reverse-dictionary.shtml?s={searchTerms}"; }];
          iconUpdateURL = "https://external-content.duckduckgo.com/ip3/www.onelook.com.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@rw" ];
        };
        "Pexels" = {
          urls = [{ template = "https://www.pexels.com/search/{searchTerms}"; }];
          iconUpdateURL = "https://external-content.duckduckgo.com/ip3/www.pexels.com.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@px" ];
        };
				"NixOS Packages" = {
          urls = [{ template = "https://search.nixos.org/packages?type=packages&query={searchTerms}"; }];
          iconUpdateURL = "https://search.nixos.org/images/nix-logo.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@np" ];
        };
        "SearXNG" = {
          urls = [{ template = "http://localhost/search?q={searchTerms}"; }];
          iconUpdateURL = "https://baresearch.org/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@sx" ];
        };
        "YouTube" = {
          urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
          iconUpdateURL = "https://duckduckgo.com/assets/icons/favicons/youtube.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [ "@yt" ];
        };
      };
    };
  };

}
