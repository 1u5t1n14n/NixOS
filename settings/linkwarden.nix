{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    linkwarden
  ];

  services.linkwarden = {
    enable = true;
    port = 3000;
    dataDir = "/var/lib/linkwarden";
  };

}
