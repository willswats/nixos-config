{ ... }:

{
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      # for a WiFi printer
      openFirewall = true;
    };
  };
}
