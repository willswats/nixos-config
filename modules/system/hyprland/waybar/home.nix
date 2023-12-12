{ pkgs, globals, host, ... }:

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
          modules-left = [ "hyprland/workspaces" "hyprland/window" "hyprland/submap" ];
          modules-right = [ "battery" "backlight" "pulseaudio#microphone" "pulseaudio" "bluetooth" "network" "clock#calendar" "clock" "tray" ];

          "hyprland/workspaces" = {
            all-outputs = true; # Display workspaces assigned to other monitors on one bar
          };

          "hyprland/window" = {
            max-length = 50;
          };

          battery = {
            interval = 1;
            format = "{icon} {capacity}%";
            format-icons = [ " " " " " " " " " " ];
          };

          backlight = {
            format = " {percent}%";
          };

          "pulseaudio#microphone" = {
            scroll-step = 5;
            format = "{format_source}";
            format-source = " {volume}%";
            format-source-muted = " 0%";
            on-click = "${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            on-scroll-up = "${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+";
            on-scroll-down = "${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%-";
          };

          pulseaudio = {
            scroll-step = 5;
            format = "󰕾 {volume}%";
            format-muted = "󰖁 0%";
            on-click = "${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          bluetooth = {
            format = "󰂯 {status}";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias} {device_battery_percentage}%";
            max-length = 20;
          };

          network = {
            format = "{icon} {ifname}";
            format-wifi = "{icon} {essid} {signalStrength}%";
            format-ethernet = "󰤨 {ifname}";
            format-disconnected = "{icon} Disconnected";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
            max-length = 20;
          };

          "clock#calendar" = {
            interval = 1;
            format = "󰭦 {:%a %d %b}";
          };

          clock = {
            interval = 1;
            format = "󱑍 {:%H:%M}";
          };

          tray = {
            icon-size = 18;
            spacing = 10;
          };
        };
      };
      style =
        let
          fontName = globals.font.name;

          rosewater = "#${globals.colours.rosewater}";
          flamingo = "#${globals.colours.flamingo}";
          pink = "#${globals.colours.pink}";
          mauve = "#${globals.colours.mauve}";
          red = "#${globals.colours.red}";
          maroon = "#${globals.colours.maroon}";
          peach = "#${globals.colours.peach}";
          yellow = "#${globals.colours.yellow}";
          green = "#${globals.colours.green}";
          blue = "#${globals.colours.blue}";
          overlay0 = "#${globals.colours.overlay0}";
          base = "#${globals.colours.base}";
          crust = "#${globals.colours.crust}";
        in
        ''
          * { 
            font-size: 20px;    
            font-family: ${fontName};
            border-radius: 0;
          }

          #window, 
          #submap, 
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
            background-color: ${base};
          }

          #submap {
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
            color: ${yellow};
          }

          #pulseaudio.microphone {
            color: ${peach};
          }

          #pulseaudio {
            color: ${maroon};
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
