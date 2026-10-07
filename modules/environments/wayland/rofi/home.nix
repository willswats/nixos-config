{ pkgs, globals, ... }:

{
  catppuccin.rofi.enable = true;

  programs.rofi = {
    enable = true;
    font = "${globals.font.name} 16";
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      show-icons = true;
    };
  };
}
