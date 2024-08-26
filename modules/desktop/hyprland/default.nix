{ inputs, pkgs, ... }:

{
  imports = [
    ./grimblast
    ./hyprlock
  ];

  programs.hypr-window-switcher.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
