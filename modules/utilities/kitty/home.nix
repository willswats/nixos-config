{ globals, pkgs, ... }:

let
  fontName = globals.font.name;
  yazi = "${pkgs.yazi}/bin/yazi";
  lazygit = "${pkgs.lazygit}/bin/lazygit";
in
{
  catppuccin.kitty.enable = true;
  programs.kitty = {
    enable = true;
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
      "ctrl+shift+enter" = "new_tab_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd nvim";
      "ctrl+shift+e" = "new_tab_with_cwd ${yazi}";
      "ctrl+shift+g" = "new_tab_with_cwd ${lazygit}";
    };
  };
}
