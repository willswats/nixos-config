{ pkgs, ... }:

{
  home.packages = with pkgs; [ spotify-player ];

  xdg.configFile."spotify-player/app.toml".text = ''
    theme = "Catppuccin-mocha"

    [device]
    volume = 50
  '';

  # https://github.com/catppuccin/spotify-player/blob/main/src/theme.toml
  xdg.configFile."spotify-player/theme.toml".text = ''
    [[themes]]
    name = "Catppuccin-mocha"
    [themes.palette]
    background = "#1E1E2E"
    foreground = "#CDD6F4"
    black = "#6c7086"
    blue = "#89B4FA"
    cyan = "#89DCEB"
    green = "#A6E3A1"
    magenta = "#CBA6F7"
    red = "#F38BA8"
    white = "#CDD6F4"
    yellow = "#F9E2AF"
    bright_black = "#6c7086"
    bright_blue = "#89B4FA"
    bright_cyan = "#89DCEB"
    bright_green = "#A6E3A1"
    bright_magenta = "#CBA6F7"
    bright_red = "#F38BA8"
    bright_white = "#CDD6F4"
    bright_yellow = "#F9E2AF"

    [themes.component_style]
    selection = { bg = "#313244", modifiers = ["Bold"] }
  '';
}