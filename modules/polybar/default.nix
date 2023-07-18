{ config, pkgs, ... }:

let
  base = "#1e1e2e";
  #mantle = "#181825";
  crust = "#11111b";

  text = "#cdd6f4";
  #subtext0 = "#a6adc8";
  #subtext1 = "#bac2de";

  #surface0 = "#313244";
  #surface1 = "#45475a";
  #surface2 = "#585b70";

  overlay0 = "#6c7086";
  #overlay1 = "#7f849c";
  #overlay2 = "#9399b2";

  blue = "#89b4fa";
  #lavender = "#b4befe";
  #sapphire = "#74c7ec";
  #sky = "#89dceb";
  #teal = "#94e2d5";
  green = "#a6e3a1";
  yellow = "#f9e2af";
  #peach = "#fab387";
  #maroon = "#eba0ac";
  red = "#f38ba8";
  mauve = "#cba6f7";
  pink = "#f5c2e7";
  #flamingo = "#f2cdcd";
  #rosewater = "#f5e0dc";

  #transparent = "#FF00000";
in
{
  services.polybar = {
    enable = true;
    script = "polybar -r";

    settings = {
      "bar/main" = {
        width = "100%";
        height = "24pt";
        background = "${base}";
        foreground = "${text}";
        radius = 0;

        line-size = "3pt";

        border-size = "0pt";
        border-color = "#00000000";

        padding-left = "0";
        padding-right = "1";

        module-margin = "1";

        font-0 = "Hack Nerd Font:size=14;2";

        modules-left = "xworkspaces i3 xwindow";
        modules-right = "battery backlight pulseaudio date time";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        tray-position = "right";
      };

      "module/xworkspaces" =
        {
          type = "internal/xworkspaces";
          label-active = "%name%";
          label-active-background = "${crust}";
          label-active-underline = "${blue}";
          label-active-padding = "1";

          label-occupied = "%name%";
          label-occupied-padding = "1";

          label-urgent = "%name%";
          label-urgent-background = "${red}";
          label-urgent-padding = "1";

          label-empty = "%name%";
          label-empty-foreground = "${overlay0}";
          label-empty-padding = "1";

        };

      "module/i3" = {
        type = "internal/i3";

        format = "<label-mode>";

        label-mode-padding = "2";
        label-mode-background = "${crust}";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };

      "module/battery" = {
        type = "internal/battery";
        format-charging = "<ramp-capacity> <label-charging>";
        format-charging-foreground = "${green}";

        format-discharging = "<ramp-capacity>  <label-discharging>";
        format-discharging-foreground = "${red}";

        format-full = "<ramp-capacity>  <label-charging>";
        format-full-foreground = "${green}";

        label-charging = "%percentage%%";

        label-discharging = "%percentage%%";

        label-full = "%percentage%%";

        label-low = "%percentage%%";

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";
      };


      "module/backlight" = {
        type = "internal/backlight";

        card = "intel_backlight";

        use-actual-brightness = "true";

        format-prefix = " ";
        format-prefix-foreground = "${yellow}";

        format = "<label>";
        format-foreground = "${yellow}";

        label = "%percentage%%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format-volume-prefix = "󰕾 ";
        format-volume-prefix-foreground = "${pink}";
        format-volume = "<label-volume>";

        label-volume = "%percentage%%";
        label-volume-foreground = "${pink}";

        label-muted = "󰖁 0%";
        label-muted-foreground = "${overlay0}";
      };

      "module/date" = {
        type = "internal/date";
        interval = "1";

        date = "%A %d %B";

        format = "󰭦 <label>";
        format-foreground = "${mauve}";

        label = "%date%";
        label-foreground = "${mauve}";
      };

      "module/time" =
        {
          type = "internal/date";
          interval = "1";

          time = "%H:%M";

          format = "󱑍 <label>";
          format-foreground = "${blue}";

          label = "%time%";
          label-foreground = "${blue}";

        };
      "settings" = {
        screenchange-reload = "true";
        pseudo-transparency = "true";
      };
    };
  };
}
