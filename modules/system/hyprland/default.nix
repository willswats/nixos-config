{ inputs, pkgs, ... }:

{
  imports = [
    ./swaylock
    ./grimblast
    ./hyprshade
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
