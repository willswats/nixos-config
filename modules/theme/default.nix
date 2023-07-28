{ config, pkgs, ... }:

{
  programs.dconf.enable = true;

  # Fix QT6 theme (https://github.com/NixOS/nixpkgs/issues/210891): 
  # environment.variables.QT_PLUGIN_PATH = "${pkgs.adwaita-qt6}/lib/qt-6/plugins";
}
