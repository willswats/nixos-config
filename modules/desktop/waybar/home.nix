{ host, ... }:

{
  programs.waybar =
    let
      monitorCenter = host.monitors.center;
    in
    {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [ monitorCenter ];
          modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        };
      };
    };
}
