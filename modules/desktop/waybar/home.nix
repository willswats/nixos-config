{ host, ... }:

{
  programs.waybar =
    let
      monitorCenter = host.monitors.center;
    in
    {
      enable = true;
      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 40;
          output = [ monitorCenter ];
          modules-left = [ "hyprland/workspaces" "hyprland/window" ];
          modules-right = [ "battery" "backlight" "pulseaudio" "clock" "tray" ];
        };
      };
      style =
        let
          base = "#1e1e2e";
          text = "#cdd6f4";
          blue = "#89b4fa";
        in
        ''
          * { 
            font-size: 14px;
          }

          #window waybar {
            color: ${text};
            background-color: ${base};
          }

          #workspaces button.focused {
            background-color: ${blue};
          }

          #battery, #backlight, #pulseaudio, #clock, #tray {
            padding: 0 10px;
          }
        '';
    };
}
