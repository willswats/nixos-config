{ ... }:

{
  imports = [
    ./swaylock
    ./grim
    ./hyprshade
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
