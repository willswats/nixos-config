{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    cargo
    rustc
  ];
}
