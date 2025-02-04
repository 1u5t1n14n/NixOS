{ ... }:

{

  services.stirling-pdf = {
    enable = true;
    environment = {
      SERVER_PORT = 8080;
    };
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];

}
