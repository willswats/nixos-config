{ pkgs, ... }:

{
  home = {
    pointerCursor = {
      x11 = {
        enable = true;
      };
      gtk = {
        enable = true;
      };
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 32; # 24 32 48 64
    };
  };
}