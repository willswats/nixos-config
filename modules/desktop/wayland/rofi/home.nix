{ pkgs, globals, ... }:

{
  catppuccin.rofi.enable = true;

  programs.rofi = {
    enable = true;
    font = "${globals.font.name} 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      show-icons = true;
    };
  };
}
