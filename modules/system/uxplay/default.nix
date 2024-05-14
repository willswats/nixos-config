{ pkgs, ... }:

{
  # Run with uxplay -p as this config opens the legacy ports
  environment.systemPackages = with pkgs; [ uxplay ];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
      domain = true;
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 7000 7001 7100 ]; # Three ports required by uxplay -p
    allowedUDPPorts = [ 5353 6000 6001 7011 ]; # First port required as stated in the README, the other three are required for uxplay -p
  };
}
