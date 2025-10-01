{ pkgs, ... }:

{
  catppuccin.rofi.enable = true;

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      show-icons = true;
    };
  };
}
