{ globals, inputs, pkgs, ... }:

{
  programs.hyprlock =
    let
      fontName = globals.font.name;
      wallpaper = globals.wallpaper;

      blue = "rgb(137, 180, 250)";
      text = "rgb(205, 214, 244)";
      base = "rgb(30, 30, 46)";
      peach = "rgb(250,179,135)";
      red = "rgb(243,139,168)";
    in
    {
      enable = true;
      package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
      settings = {
        general = {
          no_fade_in = true;
          no_fade_out = true;
        };

        background = [{
          monitor = "";
          path = "${wallpaper}";
          color = base;

          blur_passes = 1;
        }];

        input-field = [{
          monitor = "";

          size = "300, 50";

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

          dots_size = 0.3;
          dots_spacing = 0.2;
          dots_center = true;
          dots_rounding = 0;
        }];

        label = [
          {
            monitor = "";
            text = "$TIME";
            text_align = "center";
            font_size = 60;
            font_family = "${fontName} Bold";
            color = blue;

            position = "0, 100";

            valign = "center";
            halign = "center";
          }
          {
            monitor = "";
            text = "cmd[update:1000] echo \"$(date +'%a %d %b')\"";
            text_align = "center";
            font_size = 20;
            font_family = fontName;
            color = blue;

            position = "0, 50";

            valign = "center";
            halign = "center";
          }
        ];
      };
    };
}
