{ ... }:

{

  services.stirling-pdf = {
    enable = true;
    environment = {
      SERVER_PORT = 8088;
    };
  };

  networking.firewall.allowedTCPPorts = [ 8088 ];

}
