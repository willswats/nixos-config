{ ... }:

{
  imports = [
    ../all/sddm
    ./swaylock
    ./grim
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
