{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    tray = true;
    provider = "geoclue2";
  };
}
