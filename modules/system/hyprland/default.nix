{ ... }:

{
  imports = [
    ./swaylock
    ./grimblast
    ./hyprshade
  ];

  services.blueman.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
