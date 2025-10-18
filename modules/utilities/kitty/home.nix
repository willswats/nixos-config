{ globals, pkgs, ... }:

let
  fontName = globals.font.name;
  yazi = "${pkgs.yazi}/bin/yazi";
  lazygit = "${pkgs.lazygit}/bin/lazygit";
  scooter = "${pkgs.scooter}/bin/scooter";
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
      allow_remote_control = true;
      kitty_mod = "alt";
    };
    keybindings = {
      "kitty_mod+1" = "goto_tab 1";
      "kitty_mod+2" = "goto_tab 2";
      "kitty_mod+3" = "goto_tab 3";
      "kitty_mod+4" = "goto_tab 4";
      "kitty_mod+5" = "goto_tab 5";
      "kitty_mod+6" = "goto_tab 6";
      "kitty_mod+7" = "goto_tab 7";
      "kitty_mod+8" = "goto_tab 8";
      "kitty_mod+9" = "goto_tab 9";
      "kitty_mod+0" = "goto_tab 10";

      "kitty_mod+enter" = "new_tab_with_cwd";
      "kitty_mod+t" = "new_tab_with_cwd $EDITOR";
      "kitty_mod+e" = "new_tab_with_cwd ${yazi}";
      "kitty_mod+r" = "new_tab_with_cwd ${scooter}";
      "kitty_mod+g" = "new_tab_with_cwd ${lazygit}";

    };
  };
}
