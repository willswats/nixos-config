{ pkgs, host, ... }:

{
  gtk =
    let
      # Disable error sound
      extraConfig = { gtk-error-bell = 0; };
      # Remove black borders https://github.com/catppuccin/gtk/issues/6#issuecomment-1443573299
      extraCss = ''
        menu,
        .csd .menu,
        .csd .dropdown,
        .csd .context-menu {
          border-radius: 0px;
        }
      '';
    in
    {
      enable = true;
      font = {
        name = "Hack";
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        size = host.font.gtkSize;
      };
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
      gtk2 = { extraConfig = "gtk-error-bell = 0"; };
      gtk3 = {
        bookmarks = host.bookmarks;
        extraConfig = extraConfig;
        extraCss = extraCss;
      };
      gtk4 = {
        extraConfig = extraConfig;
        extraCss = extraCss;
      };
    };

  # GTK4 Theme
  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-dark";
}
