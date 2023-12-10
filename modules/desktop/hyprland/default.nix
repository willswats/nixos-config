{ ... }:

{
  imports = [
    ./swaylock
    ./grimblast
    ./hyprshade
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
