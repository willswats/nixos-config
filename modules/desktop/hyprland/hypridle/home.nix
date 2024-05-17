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
