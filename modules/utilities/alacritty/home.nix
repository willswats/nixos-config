{ pkgs, ... }:

{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "Hack Nerd Font";
        bold.family = "Hack Nerd Font";
        italic.family = "Hack Nerd Font";
      };

      env.TERM = "xterm-256color";

      # Catppuccin Mocha Theme
      colors = {
        primary = {
          background = "#1E1E2E"; # base
          foreground = "#CDD6F4"; # text
          # Bright and dim foreground colors
          dim_foreground = "#CDD6F4"; # text
          bright_foreground = "#CDD6F4"; # text
        };
        # Cursor colors
        cursor = {
          text = "#1E1E2E"; # base
          cursor = "#F5E0DC"; # rosewater
          vi_mode_cursor = {
            text = "#1E1E2E"; # base
            cursor = "#B4BEFE"; # lavender
          };
        };
        search = {
          matches = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
            focused_match = {

              foreground = "#1E1E2E"; # base
              background = "#A6E3A1"; # green
            };
            footer_bar = {
              foreground = "#1E1E2E"; # base
              background = "#A6ADC8"; # subtext0
            };
          };
        };
        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#1E1E2E"; # base
            background = "#F9E2AF"; # yellow
          };
          end = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
        };
        selection = {
          text = "#1E1E2E"; # base
          background = "#F5E0DC"; # rosewater
        };

        normal = {

          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE"; # subtext1
        };

        bright = {

          black = "#585B70"; # surface2
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#A6ADC8"; # subtext0
        };
        dim = {
          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE"; # subtext1
        };
        indexed_colors = [
          {
            index = 16;
            color = "#FAB387";
          }
          {
            index = 17;
            color = "#F5E0DC";
          }
        ];
      };
    };
  };
}