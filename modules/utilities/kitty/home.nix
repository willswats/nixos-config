{ globals, inputs, pkgs, ... }:

let
  fontName = globals.font.name;
  yazi = "${inputs.yazi.packages.${pkgs.system}.yazi}/bin/yazi";
in
{
  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    font = {
      name = fontName;
      size = 14;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      placement_strategy = "top-left";
      tab_bar_edge = "top";
      tab_bar_style = "separator";
      tab_separator = "|";
    };
    keybindings = {
      # Open with cwd
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+shift+n" = "new_os_window_with_cwd";
      "ctrl+shift+enter" = "new_window_with_cwd";
      # Open programs
      "ctrl+shift+o" = "new_os_window_with_cwd nvim";
      "ctrl+shift+f" = "new_os_window_with_cwd ${yazi}";
    };
  };
}
