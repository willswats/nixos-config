{ ... }:

{
  imports = [
    ./grimblast
    ./hyprlock
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
