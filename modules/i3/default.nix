{ config, pkgs, ... }:

{
  imports = [
    ../redshift
  ];

  services = {
    blueman.enable = true;

    xserver = {
      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        lightdm = {
          enable = true;
          background = ../../wallpapers/minimal-desert.png;
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
        defaultSession = "none+i3";
      };

      windowManager.i3.enable = true;
    };
  };
}
