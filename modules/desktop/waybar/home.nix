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
            format = "{icon}  {capacity}%";
            format-icons = [ " " " " " " " " " " ];
          };

          backlight = {
            format = "  {percent}%";
          };

          pulseaudio = {
            scroll-step = 5;
            format = "󰕾  {volume}%";
            format-muted = "󰖁  0%";
          };

          clock = {
            interval = 1;
            format = "󰭦  {:%A %d %B  󱑍  %H:%M}";
          };
        };
      };
      style =
        let
          base = "#1e1e2e";
          text = "#cdd6f4";
          blue = "#89b4fa";
          green = "#a6e3a1";
          # red = "#f38ba8";
          yellow = "#f9e2af";
          # mauve = "#cba6f7";
          pink = "#f5c2e7";
        in
        ''
          * { 
            font-size: 18px;    
            font-family: Hack;
            border-radius: 0;
          }

          #window waybar {
            color: ${text};
            background-color: ${base};
          }

           #workspaces button.active {
            background-color: ${blue};
          }

          #battery, #backlight, #pulseaudio, #clock, #tray {
            padding: 0 10px;
          }

          #battery {
            color: ${green};
          }

          #xbacklight {
            color: ${yellow};
          }

          #pulseaudio{
            color: ${pink};
          }

          #clock{
            color: ${blue};
          }
        '';
    };
}
