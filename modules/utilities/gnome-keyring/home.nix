{ pkgs, ... }:

{
  home.packages = with pkgs; [ gnome.seahorse gcr ];
}
