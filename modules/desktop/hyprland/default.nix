{ ... }:

{
  imports = [
    ./grimblast
    ./hyprlock
    ./greetd
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
