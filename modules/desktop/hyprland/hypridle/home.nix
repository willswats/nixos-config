{ pkgs, ... }:

{
  services.hypridle =
    let
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      rg = "${pkgs.ripgrep}/bin/rg";
      # Both of these scripts check if there are no audio streams with "active"
      # (there will be active audio streams when there is no audio playing, as long as a program is open that outputs audio)
      # Both of these scripts could be replaced, if this issues gets closed with a PR: https://github.com/hyprwm/hypridle/issues/27
      streamsActive = ''
        streams_active() {
          ${wpctl} status | ${rg} "active"
        }
      '';
      lock = pkgs.writeShellScript "lock" ''
        ${streamsActive}

        if ! streams_active; then 
          ${playerctl} --all-players pause
          ${swaylock}
        fi
      '';
      dpmsOff = pkgs.writeShellScript "dpmsOff" ''
        ${streamsActive}

        if ! streams_active; then 
          ${playerctl} --all-players pause
          ${hyprctl} dispatch dpms off
        fi
      '';
    in
    {
      enable = true;
      listeners = [
        {
          timeout = 1800;
          onTimeout = lock.outPath;
        }
        {
          timeout = 300;
          onTimeout = dpmsOff.outPath;
          onResume = "${hyprctl} dispatch dpms on";
        }
      ];
    };
}
