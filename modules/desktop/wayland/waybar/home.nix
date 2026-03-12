{ globals
, config
, lib
, ...
}:

{
  programs.waybar =
    let
      swayEnabled = config.wayland.windowManager.sway.enable;
      hyprlandEnabled = config.wayland.windowManager.hyprland.enable;
      modules-left =
        (lib.optionals swayEnabled [
          "sway/workspaces"
          "sway/window"
          "sway/mode"
        ])
        ++ (lib.optionals hyprlandEnabled [
          "hyprland/workspaces"
          "hyprland/window"
          "hyprland/submap"
        ]);
    in
    {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 40;
          modules-left = modules-left;
          modules-right = [
            "battery"
            "backlight"
            "pulseaudio#microphone"
            "pulseaudio"
            "bluetooth"
            "network"
            "clock#calendar"
            "clock"
            "tray"
          ];

          "sway/workspaces" = lib.mkIf swayEnabled {
            disable-scroll = true;
          };

          "sway/window" = lib.mkIf swayEnabled {
            max-length = 50;
            tooltip = false;
          };

          "hyprland/workspaces" = lib.mkIf hyprlandEnabled {
            all-outputs = false;
          };

          "hyprland/window" = lib.mkIf hyprlandEnabled {
            max-length = 40;
          };

          battery = {
            interval = 1;
            format = "{icon} {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
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
            cursor = false;
          };

          pulseaudio = {
            scroll-step = 5;
            format = "󰕾 {volume}%";
            format-muted = "󰖁 0%";
            on-click = "";
            on-scroll-up = "";
            on-scroll-down = "";
            tooltip = false;
            cursor = false;
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
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            max-length = 20;
            tooltip = false;
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
          mantle = "#${globals.colours.mantle}";
          crust = "#${globals.colours.crust}";

          swayStyle = lib.optionalString swayEnabled ''
            #mode {
              color: ${blue};
              background-color: ${mantle};
              margin: 4px 2px 4px 2px;
              padding: 0 10px;
            }

            #workspaces button.focused {
              color: ${blue};
              background-color: ${crust};
            }
          '';

          hyprlandStyle = lib.optionalString hyprlandEnabled ''
            #submap {
              color: ${blue};
              background-color: ${mantle};
              margin: 4px 2px 4px 2px;
              padding: 0 10px;
            } 

            #workspaces button.active {
              color: ${blue};
              background-color: ${crust};
            }
          '';

          baseStyle = ''
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
            #battery, 
            #backlight, 
            #pulseaudio, 
            #bluetooth, 
            #network, 
            #clock,
            #tray {
              background-color: ${mantle};
              margin: 4px 2px 4px 2px;
            }

            #window, 
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
              all: initial; /* Remove default styles from gtk */
              color: ${overlay0};
              padding: 5px 10px;
            }

            #tray {
              margin-right: 4px;
            }

            #workspaces { 
              margin-left: 4px;
            }

            #workspaces button:hover {
              box-shadow: inherit;
              text-shadow: inherit;
              color: ${blue};
              background-color: ${crust};
              border: ${crust};
            }

            #window {
              color: ${blue}; 
            }

            window#waybar.empty #window {
              padding: 0;
              margin: 0;
              background-color: transparent;
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
        in
        baseStyle + swayStyle + hyprlandStyle;
    };
}
