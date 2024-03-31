{ inputs, pkgs, ... }:

{
  imports = [
    ./grimblast
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
