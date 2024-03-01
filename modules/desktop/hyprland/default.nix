{ inputs, pkgs, ... }:

{
  imports = [
    ./grimblast
    ./hyprshade
    ./swaylock
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
