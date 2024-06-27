{ globals, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        modules-left = [ "sway/workspaces" "sway/window" "sway/mode" ];
        modules-right = [ "battery" "backlight" "pulseaudio#microphone" "pulseaudio" "bluetooth" "network" "clock#calendar" "clock" "tray" ];

        "sway/workspaces" = {
          all-outputs = true; # Display workspaces assigned to other monitors on one bar
          disable-scroll = true;
        };

        "sway/window" = {
          max-length = 50;
        };

        battery = {
          interval = 1;
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        backlight = {
          format = " {percent}%";
        };

        "pulseaudio#microphone" = {
          scroll-step = 5;
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " 0%";
          on-click = "";
          on-scroll-up = "";
          on-scroll-down = "";
          tooltip = false;
        };

        pulseaudio = {
          scroll-step = 5;
          format = "󰕾 {volume}%";
          format-muted = "󰖁 0%";
          on-click = "";
          on-scroll-up = "";
          on-scroll-down = "";
          tooltip = false;
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
        base = "rgba(30, 30, 46, 0.9)";
        mantle = "rgba(24,24,37, 0.9)";
        crust = "rgba(17, 17, 27, 0.9)";
      in
      ''
        * { 
          font-size: 18px;    
          font-family: ${fontName};
          border-radius: 0;
        }
          
        window#waybar {
          background-color: ${base};
        }

        #workspaces,
        #window, 
        #submap, 
        #battery, 
        #backlight, 
        #pulseaudio, 
        #bluetooth, 
        #network, 
        #clock,
        #tray {
          border-radius: 5px;
          background-color: ${mantle};
          margin: 4px 2px 4px 2px;
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

        #tray {
          margin-right: 4px;
        }

        #workspaces { 
          margin-left: 4px;
        }

        #workspaces button {
          color: ${overlay0};
          border-radius: 5px;
        }

        #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          color: ${blue};
          background-color: ${crust};
          border: ${crust};
        }

        #workspaces button.active {
          color: ${blue};
          background-color: ${crust};
        }

        #window {
          color: ${blue}; 
        }

        window#waybar.empty #window {
          padding: 0;
          margin: 0;
          background-color: transparent;
        }

        #submap {
          color: ${blue};
          background-color: ${mantle};
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
