{ pkgs, ... }:

{
  services =
    let
      swaylock = "${pkgs.swaylock}/bin/swaylock";
      swaymsg = "${pkgs.sway}/bin/swaymsg";

      # Both of these scripts check if there are no audio streams with "active"
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      rg = "${pkgs.ripgrep}/bin/rg";
      streamsActive = ''
        streams_active() {
          ${wpctl} status | ${rg} "active"
        }
      '';
      lock = pkgs.writeShellScript "lock" ''
        ${streamsActive}

        if ! streams_active; then 
          ${swaylock}
        fi
      '';
      dpmsOff = pkgs.writeShellScript "dpmsOff" ''
        ${streamsActive}

        if ! streams_active; then 
          ${swaymsg} 'output * power off'
        fi
      '';
    in
    {
      swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 1800; # 1800 seconds = 30 minutes
            command = lock.outPath;
          }
          {
            timeout = 600; # 600 seconds = 10 minutes
            command = dpmsOff.outPath;
            resumeCommand = "${swaymsg} 'output * power on'";
          }
        ];
        events = {
          "before-sleep" = swaylock;
          "lock" = swaylock;
        };
      };
    };
}
