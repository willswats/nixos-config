{ pkgs, ... }:

{
  services.hypridle =
    let
      hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      rg = "${pkgs.ripgrep}/bin/rg";
      # Both of these scripts check if there are no audio streams with "active"
      # Both of these scripts could be replaced, if this issues gets closed with a PR: https://github.com/hyprwm/hypridle/issues/27
      streamsActive = ''
        streams_active() {
          ${wpctl} status | ${rg} "active"
        }
      '';
      lock = pkgs.writeShellScript "lock" ''
        ${streamsActive}

        if ! streams_active; then 
          ${hyprlock}
        fi
      '';
      dpmsOff = pkgs.writeShellScript "dpmsOff" ''
        ${streamsActive}

        if ! streams_active; then 
          ${hyprctl} dispatch dpms off
        fi
      '';
    in
    {
      enable = true;
      settings = {
        general.lock_cmd = hyprlock;
        listener = [
          {
            timeout = 1800;
            on-timeout = lock.outPath;
          }
          {
            timeout = 600;
            on-timeout = dpmsOff.outPath;
            on-resume = "${hyprctl} dispatch dpms on";
          }
        ];
      };
    };
}
