{ pkgs, inputs, ... }:

{
  services.hypridle =
    let
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      hyprlock = "${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock";
      hyprctl = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl";
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
          ${hyprlock}
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
      package = inputs.hypridle.packages.${pkgs.system}.hypridle;
      settings = {
        general = {
          before_sleep_cmd = "${hyprlock}";
          after_sleep_cmd = "${hyprctl} dispatch dpms on";
        };
        listener = [
          {
            timeout = 1800;
            onTimeout = lock.outPath;
          }
          {
            timeout = 600;
            onTimeout = dpmsOff.outPath;
            onResume = "${hyprctl} dispatch dpms on";
          }
        ];
      };
    };
}
