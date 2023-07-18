{ config, pkgs, ... }:

{
  imports = [ ../dunst ../rofi ];

  home.packages = with pkgs; [
    polybar
    feh
    pavucontrol
    brightnessctl
    redshift
    networkmanagerapplet
    lxde.lxsession
  ];

  services = {
    gnome-keyring.enable = true;
    picom.enable = true;
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    redshift = {
      enable = true;
      tray = true;
      provider = "geoclue2";
    };
  };
}
