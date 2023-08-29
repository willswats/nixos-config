{ pkgs, ... }:

{
  imports = [ ../../i3/rofi/home.nix ];

  programs.rofi.package = pkgs.rofi-wayland;
}
