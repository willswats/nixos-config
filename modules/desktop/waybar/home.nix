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

          battery = {
            states = {
              good = 70;
              warning = 25;
              critical = 10;
            };
            format = "{icon} {capacity}%";
            format-charging = "  {capacity}%";
            format-plugged = "  {capacity}%";
            format-alt = "{icon} {time}";
            format-time = "{H}h{M}";
            format-icons = [ " " " " " " " " " " ];
          };

          backlight = {
            format = "{icon} {percent}%";
            format-icons = [ "" ];
          };

          pulseaudio = {
            # "scroll-step" = 1 // % can be a float;
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = "󰝟 {icon} {format_source}";
            format-muted = "󰝟 {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphones = "";
              handsfree = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ " " " " " " ];
            };
            on-click = "pavucontrol";
          };

          clock = {
            interval = 1;
            format = "{:%B %d, %H:%M}";
            tooltip = true;
            tooltip-format = "{:%H:%M:%S}";
          };

          tray = { icon-size = 18; spacing = 10; };
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
            font-family: Hack;
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
