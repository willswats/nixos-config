{ globals, ... }:


{
  programs.wezterm = {
    enable = true;
    extraConfig =
      let
        fontName = globals.font.name;
      in
      ''
        return {
          font = wezterm.font("${fontName}"),
          font_size = 14.0,
          color_scheme = "Catppuccin Mocha",
          enable_tab_bar = false,
          window_close_confirmation = "NeverPrompt",
          window_padding = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
          }
        }
      '';
  };
}
