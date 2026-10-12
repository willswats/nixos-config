{ config, pkgs, ... }:

{
  services =
    let
      swaylock = "${pkgs.swaylock}/bin/swaylock";

      swaymsg = "${pkgs.sway}/bin/swaymsg";
      swayMonitorOff = "${swaymsg} 'output * power off'";
      swayMonitorOn = "${swaymsg} 'output * power off'";

      niri = "${pkgs.niri}/bin/niri";
      niriMonitorOff = "${niri} msg action power-off-monitors";
      niriMonitorOn = "${niri} msg action power-on-monitors";


      monitorOffCmd =
        if config.wayland.windowManager.sway.enable then
          swayMonitorOff
        else if config.wayland.windowManager.niri.enable then
          niriMonitorOff
        else "";


      monitorOnCmd =
        if config.wayland.windowManager.sway.enable then
          swayMonitorOn
        else if config.wayland.windowManager.niri.enable then
          niriMonitorOn
        else "";

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
            command = monitorOffCmd;
            resumeCommand = monitorOnCmd;
          }
        ];
        events = {
          "before-sleep" = swaylock;
          "lock" = swaylock;
        };
      };
    };
}
