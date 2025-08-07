{ pkgs, ... }:

{
  services.hypridle =
    let
      hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
    in
    {
      enable = true;
      settings = {
        general.lock_cmd = hyprlock;
        listener = [
          {
            timeout = 1800;
            on-timeout = hyprlock;
          }
          {
            timeout = 600;
            on-timeout = "${hyprctl} dispatch dpms off";
            on-resume = "${hyprctl} dispatch dpms on";
          }
        ];
      };
    };
}
