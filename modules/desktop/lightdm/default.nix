{ pkgs, globals, ... }:

{
  services.xserver = {
    displayManager = {
      lightdm = {
        enable = true;
        background = globals.wallpaper;
        greeters.gtk = {
          enable = true;
          theme = {
            name = "Catppuccin-Mocha-Standard-Blue-dark";
            package = pkgs.catppuccin-gtk.override {
              accents = [ "blue" ];
              size = "standard";
              variant = "mocha";
            };
          };
          iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.catppuccin-papirus-folders.override {
              accent = "blue";
              flavor = "mocha";
            };
          };
          cursorTheme = {
            name = "Catppuccin-Mocha-Dark-Cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 32; # 24 32 48 64
          };
        };
      };
    };
  };
}