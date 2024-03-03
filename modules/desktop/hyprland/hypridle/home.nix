{ pkgs, ... }:

{
  services.hypridle =
    let
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
      dpmsOff = pkgs.writeShellScript "dpmsOff" ''
        # This counts the number of running audio sources as lines.
        # For some reason there is always two running audio sources.
        # This checks if LINES is less than 3.
        LINES=$(pw-cli i all 2>&1 | rg running | wc -l)
        if [ "$LINES" -lt 3 ]; then
          ${hyprctl} dispatch dpms off
        fi
      '';
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
          onTimeout = dpmsOff.outPath;
          onResume = "${hyprctl} dispatch dpms on";
        }
      ];
    };
}
