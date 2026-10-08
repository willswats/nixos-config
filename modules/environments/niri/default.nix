{ ... }:

{
  imports = [
    ../sway/swaylock
    ../wayland/greetd
  ];

  programs.niri = {
    enable = true;
  };
}
