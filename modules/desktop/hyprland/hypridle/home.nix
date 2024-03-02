{ pkgs, ... }:

{
  services.hypridle =
    let
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
    in
    {
      enable = true;
      listeners = [
        {
          timeout = 1800;
          onTimeout = swaylock;
        }
        {
          timeout = 600;
          onTimeout = "${hyprctl} dispatch dpms off";
          onResume = "${hyprctl} dispatch dpms on";
        }
      ];
    };
}
