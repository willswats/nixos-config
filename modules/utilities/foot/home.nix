{ globals, ... }:

let
  font = globals.font.name;

  pink = globals.colours.pink;
  red = globals.colours.red;
  yellow = globals.colours.yellow;
  green = globals.colours.green;
  teal = globals.colours.teal;
  blue = globals.colours.blue;
  text = globals.colours.text;
  subtext1 = globals.colours.subtext1;
  subtext0 = globals.colours.subtext0;
  surface2 = globals.colours.surface2;
  surface1 = globals.colours.surface1;
  base = globals.colours.base;
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "${font}:size=14";
      };
      # https://github.com/catppuccin/foot/blob/main/catppuccin-mocha.ini
      colors = {
        foreground = text; # Text
        background = base; # Base
        regular0 = surface1; # Surface 1
        regular1 = red; # red
        regular2 = green; # green
        regular3 = yellow; # yellow
        regular4 = blue; # blue
        regular5 = pink; # pink
        regular6 = teal; # teal
        regular7 = subtext1; # Subtext 1
        bright0 = surface2; # Surface 2
        bright1 = red; # red
        bright2 = green; # green
        bright3 = yellow; # yellow
        bright4 = blue; # blue
        bright5 = pink; # pink
        bright6 = teal; # teal
        bright7 = subtext0; # Subtext 0
      };
    };
  };
}
