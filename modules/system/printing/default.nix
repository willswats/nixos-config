{ ... }:

{
  services = {
    printing.enable = false;
    avahi = {
      enable = false;
      nssmdns4 = false;
      # for a WiFi printer
      openFirewall = false;
    };
  };
}
