{ pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.seahorse ];

  services.gnome-keyring.enable = true;
}
