{ inputs, pkgs, ... }:

{
  imports = [
    ./grimblast
    ./hyprlock
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
