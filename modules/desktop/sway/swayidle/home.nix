{ pkgs, ... }:

let
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
in
{
  services = {
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
      events = [
        { event = "before-sleep"; command = swaylock; }
        { event = "lock"; command = swaylock; }
      ];
    };
  };
}
