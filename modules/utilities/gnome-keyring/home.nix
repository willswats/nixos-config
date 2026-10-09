{ pkgs, ... }:

{
  home.packages = with pkgs; [
    seahorse
    gcr_4
  ];
}
