{ pkgs, globals, ... }:

{
  catppuccin.rofi.enable = true;

  programs.rofi = {
    enable = true;
    settings = {
      font = "${globals.font.name} 16";
      terminal = "${pkgs.kitty}/bin/kitty";
      show-icons = true;
    };
  };
}
