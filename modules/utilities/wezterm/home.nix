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
          -- Disable Wayland as WezTerm is currently broken on Hyprland
          -- https://github.com/hyprwm/Hyprland/issues/4806
          enable_wayland = false,

          -- Font and theme
          font = wezterm.font("${fontName}"),
          font_size = 14.0,
          color_scheme = "Catppuccin Mocha",
          window_padding = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
          },

          -- Edit tab bar
          use_fancy_tab_bar = false,
          hide_tab_bar_if_only_one_tab = true,

          -- Disable window close prompts
          window_close_confirmation = "NeverPrompt",
          keys = {
            {
              key = "w",
              mods = "CTRL|SHIFT",
              action = wezterm.action.CloseCurrentTab { confirm = false },
            },
          }
        }
      '';
  };
}
