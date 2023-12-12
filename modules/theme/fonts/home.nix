{ pkgs, globals, ... }:


let
  fontPackage = globals.font.package;
in
{
  fonts.fontconfig.enable = true;
  home.packages = [ (pkgs.nerdfonts.override { fonts = [ fontPackage ]; }) ];
}
