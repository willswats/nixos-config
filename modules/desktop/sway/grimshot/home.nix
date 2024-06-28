{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sway-contrib.grimshot
  ];
}
