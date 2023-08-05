{ pkgs, ... }:

{
  # Fix QT6 theme (https://github.com/NixOS/nixpkgs/pull/211003#issuecomment-1652277619): 
  environment.variables.QT_PLUGIN_PATH =
    "${pkgs.qt6Packages.qt6gtk2}/lib/qt-6/plugins";
}
