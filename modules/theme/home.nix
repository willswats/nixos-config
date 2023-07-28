{ config, pkgs, ... }:

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
    # GTK4 Theme
    sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-dark";
  };

  # GTK3 Theme
  gtk = {
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
    # Remove black borders https://github.com/catppuccin/gtk/issues/6#issuecomment-1443573299
    gtk3.extraCss = ''
      menu,
      .csd .menu,
      .csd .dropdown,
      .csd .context-menu {
        border-radius: 0px;
      }
    '';
  };

  qt = {
    enable = true;
    # Does not support QT6
    platformTheme = "gtk";
    style = {
      name = "gtk2";
    };
  };

  # qt = {
  #   enable = true;
  #   # Supports QT6 
  #   platformTheme = "gnome";
  #   style = {
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt6;
  #   };
  # };
}
