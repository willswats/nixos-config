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
          modules-left = [ "hyprland/workspaces" "hyprland/window" "hyprland/submap" "keyboard-state" ];
          modules-right = [ "battery" "backlight" "pulseaudio" "bluetooth" "network" "clock#calendar" "clock" "tray" ];

          "hyprland/workspaces" = {
            all-outputs = true; # Display workspaces assigned to other monitors on one bar
          };

          "hyprland/window" = {
            max-length = 50;
          };

          keyboard-state = {
            capslock = true;
            format = {
              capslock = "{icon}";
            };
            format-icons = {
              locked = "󰌎";
              unlocked = "";
            };
          };

          battery = {
            interval = 1;
            format = "{icon}  {capacity}%";
            format-icons = [ "" "" "" "" "" ];
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

          bluetooth = {
            format = "󰂯  {status}";
            format-connected = "  {device_alias}";
            format-connected-battery = "  {device_alias} {device_battery_percentage}%";
          };

          network = {
            format = "{icon}  {ifname}";
            format-wifi = "{icon}  {essid} {signalStrength}%";
            format-ethernet = "󰤨  {ifname}";
            format-disconnected = "{icon}  Disconnected";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          };

          "clock#calendar" = {
            interval = 1;
            format = "󰭦  {:%A %d %B}";
          };

          clock = {
            interval = 1;
            format = "󱑍  {:%H:%M}";
          };

          tray = {
            icon-size = 18;
            spacing = 10;
          };
        };
      };
      style =
        let
          crust = "#11111b";

          overlay0 = "#6c7086";

          blue = "#89b4fa";
          green = "#a6e3a1";
          peach = "#fab387";
          maroon = "#eba0ac";
          red = "#f38ba8";
          mauve = "#cba6f7";
          pink = "#f5c2e7";
          flamingo = "#f2cdcd";
          rosewater = "#f5e0dc";
        in
        ''
          * { 
            font-size: 18px;    
            font-family: Hack;
            border-radius: 0;
          }

          #window, 
          #submap, 
          #keyboard-state label.locked, 
          #battery, 
          #backlight, 
          #pulseaudio, 
          #bluetooth, 
          #network, 
          #clock, 
          #tray {
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

          #submap {
            color: ${blue};
            background-color: ${crust};
          }

          #keyboard-state label.locked {
            color: ${blue};
            background-color: ${crust};
          }

          #battery.full, 
          #battery.charging, 
          #battery.plugged {
            color: ${green};
          }

          #battery.discharging {
            color: ${red};
          }

          #xbacklight {
            color: ${peach};
          }

          #pulseaudio{
            color: ${maroon};
          }

          #pulseaudio.muted {
            color: ${overlay0};
          }

          #bluetooth {
            color: ${mauve};
          }

          #network {
            color: ${pink};
          }

          #clock.calendar {
            color: ${flamingo};
          }

          #clock{
            color: ${rosewater};
          }
        '';
    };
}
