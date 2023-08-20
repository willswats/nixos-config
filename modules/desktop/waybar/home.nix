{ pkgs, host, ... }:

{
  programs.waybar =
    let
      monitorCenter = host.monitors.center;

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
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
          modules-right = [ "battery" "backlight" "pulseaudio" "clock#calendar" "clock" "tray" ];

          "hyprland/workspaces" = {
            all-outputs = true; # Display workspaces assigned to other monitors on one bar
          };

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
            on-click = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          "clock#calendar" = {
            interval = 1;
            format = "󰭦  {:%A %d %B}";
          };

          clock = {
            interval = 1;
            format = "󱑍  {:%H:%M}";
          };
        };
      };
      style =
        let
          overlay0 = "#6c7086";
          blue = "#89b4fa";
          green = "#a6e3a1";
          # red = "#f38ba8";
          yellow = "#f9e2af";
          rosewater = "#f5e0dc";
          mauve = "#cba6f7";
          pink = "#f5c2e7";
        in
        ''
          * { 
            font-size: 18px;    
            font-family: Hack;
            border-radius: 0;
          }

          #battery, #backlight, #pulseaudio, #clock, #tray {
            padding: 0 10px;
          }

          #workspaces button {
            color: ${overlay0};
          }

          #workspaces button.active {
            color: ${blue};
          }

          #window {
            color: ${blue}; 
          }

          #battery {
            color: ${green};
          }

          #xbacklight {
            color: ${yellow};
          }

          #pulseaudio{
            color: ${rosewater};
          }

          #pulseaudio.muted {
            color: ${overlay0};
          }

          #clock.calendar {
            color: ${pink};
          }

          #clock{
            color: ${mauve};
          }
        '';
    };
}
