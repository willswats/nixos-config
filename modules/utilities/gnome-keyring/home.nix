{ pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.seahorse gcr ];

  services.gnome-keyring.enable = true;
}
