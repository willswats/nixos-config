{ pkgs, ... }:

{
  xdg.configFile."hypr/hypridle.conf" =
    let
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
    in
    {
      # 1800 = 30 minutes
      # 600 = 10 minutes
      text = ''
        listener {
            timeout = 1800
            on-timeout = ${swaylock}
        }

        listener {
            timeout = 600
            on-timeout = ${hyprctl} dispatch dpms off
            on-resume = ${hyprctl} dispatch dpms on
        }
      '';
    };
}
