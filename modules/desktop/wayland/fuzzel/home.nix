{ globals, ... }:

let
  fontName = globals.font.name;
  base = "${globals.colours.base}e6"; # 0.9
  text = "${globals.colours.text}ff";
  red = "${globals.colours.red}ff";
  surface2 = "${globals.colours.surface2}ff";
  blue = "${globals.colours.blue}ff";
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        fuzzy = "yes";
        font = "${fontName}:size=14";
        icon-theme = "Papirus-Dark";
        width = 40;
        lines = 10;
        line-height = 25;
        dpi-aware = "no";
      };

      # All colors must be specified as a RGBA quadruple, in hex format, without a leading '0x'
      # https://man.archlinux.org/man/fuzzel.1.en#COLORS
      colors = {
        background = base;
        text = text;
        match = red;
        selection = surface2;
        selection-match = red;
        selection-text = text;
        border = blue;
      };
      border = {
        width = 2;
        radius = 5;
      };
    };
  };
}
