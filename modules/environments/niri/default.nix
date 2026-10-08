{ ... }:

{
  imports = [
    ../sway/swaylock
    ../sway/grimshot
    ../wayland/greetd
  ];

  programs.niri = {
    enable = true;
  };
}
