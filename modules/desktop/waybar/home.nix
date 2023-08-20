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

        "clock" = {
          "format" = "{:%H:%M}  ";
          "format-alt" = "{:%A; %B %d, %Y (%R)}  ";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
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
