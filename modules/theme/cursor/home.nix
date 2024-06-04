{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 32; # 24 32 48 64
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "Catppuccin-Mocha-Dark";
    };
  };

  gtk = {
    enable = true;
    catppuccin.cursor.enable = true;
    cursorTheme.size = 32;
  };
}
