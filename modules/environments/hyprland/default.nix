{ ... }:

{
  imports = [
    ./grimblast
    ./hyprlock
    ../wayland/greetd
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
