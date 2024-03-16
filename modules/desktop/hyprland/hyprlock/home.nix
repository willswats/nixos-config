{ globals, host, ... }:

{
  programs.hyprlock =
    let
      fontName = globals.font.name;

      monitorCenter = host.monitors.center;

      blue = "rgb(137, 180, 250)";
      text = "rgb(205, 214, 244)";
      base = "rgb(30, 30, 46)";
    in
    {
      enable = true;

      general = {
        no_fade_in = true;
      };

      backgrounds = [{
        monitor = "";
        path = "";
        color = base;
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

        fade_on_empty = false;
        placeholder_text = "";

        dots_spacing = 0.3;
        dots_center = true;
      }];

      labels = [
        {
          monitor = monitorCenter;
          text = "$TIME";
          font_size = 50;
          font_family = fontName;
          color = blue;

          position = {
            x = 0;
            y = 100;
          };

          valign = "center";
          halign = "center";
        }
        {
          monitor = monitorCenter;
          text = "cmd[update:1000] echo \"$(date +'%a %d %b')\"";
          font_size = 25;
          font_family = fontName;
          color = blue;

          position = {
            x = 0;
            y = 20;
          };

          valign = "center";
          halign = "center";
        }
      ];
    };
}
