{ pkgs, ... }:

{
  # Fix QT6 theme (https://github.com/NixOS/nixpkgs/issues/210891): 
  environment.variables.QT_PLUGIN_PATH = "${pkgs.qt6Packages.qt6gtk2}/lib/qt-6/plugins";
}
