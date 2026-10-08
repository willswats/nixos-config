{ pkgs, ... }:

{
  services =
    let
      swaylock = "${pkgs.swaylock}/bin/swaylock";
      swaymsg = "${pkgs.sway}/bin/swaymsg";
    in
    {
      swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 1800; # 1800 seconds = 30 minutes
            command = swaylock;
          }
          {
            timeout = 600; # 600 seconds = 10 minutes
            command = "${swaymsg} 'output * power off'";
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
