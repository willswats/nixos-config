{ pkgs, ... }:

{
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
    gtk2 = {
      extraConfig = "gtk-error-bell = 0";
    };
    gtk3 = {
      bookmarks =
        let
          bookmarkStart = "file:///home/will/";
        in
        [
          "${bookmarkStart}Downloads Downloads"
          "${bookmarkStart}Code Code"
        ];
      extraConfig = {
        gtk-error-bell = 0;
      };
      # Remove black borders https://github.com/catppuccin/gtk/issues/6#issuecomment-1443573299
      extraCss = ''
        menu,
        .csd .menu,
        .csd .dropdown,
        .csd .context-menu {
          border-radius: 0px;
        }
      '';
    };
    gtk4 = {
      extraConfig = {
        gtk-error-bell = 0;
      };
      # Remove black borders https://github.com/catppuccin/gtk/issues/6#issuecomment-1443573299
      extraCss = ''
        menu,
        .csd .menu,
        .csd .dropdown,
        .csd .context-menu {
          border-radius: 0px;
        }
      '';
    };
  };

  # GTK4 Theme
  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-dark";
}
