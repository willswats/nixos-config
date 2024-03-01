{ pkgs, globals, ... }:

let
  fontName = globals.font.name;

  rosewater = "#${globals.colours.rosewater}";
  pink = "#${globals.colours.pink}";
  red = "#${globals.colours.red}";
  peach = "#${globals.colours.peach}";
  yellow = "#${globals.colours.yellow}";
  green = "#${globals.colours.green}";
  teal = "#${globals.colours.teal}";
  blue = "#${globals.colours.blue}";
  lavender = "#${globals.colours.lavender}";
  text = "#${globals.colours.text}";
  subtext1 = "#${globals.colours.subtext1}";
  subtext0 = "#${globals.colours.subtext0}";
  surface2 = "#${globals.colours.surface2}";
  surface1 = "#${globals.colours.surface1}";
  base = "#${globals.colours.base}";
in
{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = fontName;
        bold.family = fontName;
        italic.family = fontName;
        size = 14;
      };

      env.TERM = "xterm-256color";

      # Converted nix version of: https://github.com/catppuccin/alacritty/blob/main/catppuccin-mocha.yml
      colors = {
        primary = {
          background = base;
          foreground = text;
          dim_foreground = text;
          bright_foreground = text;
        };

        cursor = {
          text = base;
          cursor = rosewater;
        };

        vi_mode_cursor = {
          text = base;
          cursor = lavender;
        };

        search = {
          matches = {
            foreground = base;
            background = subtext0;
          };
          focused_match = {
            foreground = base;
            background = green;
          };
        };

        footer_bar = {
          foreground = base;
          background = subtext0;
        };

        hints = {
          start = {
            foreground = base;
            background = yellow;
          };
          end = {
            foreground = base;
            background = subtext0;
          };
        };

        selection = {
          text = base;
          background = rosewater;
        };

        normal = {
          black = surface1;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = pink;
          cyan = teal;
          white = subtext1;
        };

        bright = {
          black = surface2;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = pink;
          cyan = teal;
          white = subtext0;
        };

        dim = {
          black = surface1;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = pink;
          cyan = teal;
          white = subtext1;
        };

        indexed_colors = [
          {
            index = 16;
            color = peach;
          }
          {
            index = 17;
            color = rosewater;
          }
        ];
      };
    };
  };
}
