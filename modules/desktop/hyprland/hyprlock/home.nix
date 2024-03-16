{ globals, host, ... }:

{
  programs.hyprlock =
    let
      fontName = globals.font.name;
      wallpaper = globals.wallpaper;

      monitorCenter = host.monitors.center;

      blue = "rgb(137, 180, 250)";
      text = "rgb(205, 214, 244)";
      base = "rgb(30, 30, 46)";
      peach = "rgb(250,179,135)";
      red = "rgb(243,139,168)";
    in
    {
      enable = true;

      general = {
        no_fade_in = true;
        no_fade_out = true;
      };

      backgrounds = [{
        monitor = "";
        path = "${wallpaper}";
        color = base;

        blur_passes = 1;
      }];

      input-fields = [{
        monitor = monitorCenter;

        size = {
          width = 300;
          height = 50;
        };

        outline_thickness = 2;

        outer_color = blue;
        inner_color = base;
        font_color = text;

        check_color = peach;
        fail_color = red;
        fail_text = "";
        fail_transition = 0;
        capslock_color = peach;

        fade_on_empty = false;
        fade_timeout = 0;
        placeholder_text = "";
        rounding = 0;

        dots_spacing = 0.3;
        dots_center = true;
        dots_rounding = 0;
      }];

      labels = [
        {
          monitor = monitorCenter;
          text = "$TIME";
          font_size = 60;
          font_family = "${fontName} Bold";
          color = blue;

          position = {
            x = 0;
            y = 80;
          };

          valign = "center";
          halign = "center";
        }
        {
          monitor = monitorCenter;
          text = "cmd[update:1000] echo \"$(date +'%a %d %b')\"";
          font_size = 20;
          font_family = fontName;
          color = blue;

          position = {
            x = 0;
            y = 10;
          };

          valign = "center";
          halign = "center";
        }
      ];
    };
}
