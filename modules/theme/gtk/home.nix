{ pkgs, globals, ... }:

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
      fontName = globals.font.name;
      fontPackage = globals.font.package;
      bookmarks =
        let
          bookmarkStart = "file://${globals.directories.home}/";
        in
        [
          "${bookmarkStart}Dropbox Drive"
          "${bookmarkStart}Dropbox/Work/Education/University University"
          "${bookmarkStart}Downloads Downloads"
          "${bookmarkStart}Pictures Pictures"
          "${bookmarkStart}Videos Videos"
          "${bookmarkStart}Code Code"
        ];
    in
    {
      enable = true;
      font = {
        name = fontName;
        package = pkgs.nerdfonts.override { fonts = [ fontPackage ]; };
        size = 10;
      };
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
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
        bookmarks = bookmarks;
        extraConfig = extraConfig;
        extraCss = extraCss;
      };
      gtk4 = {
        extraConfig = extraConfig;
        extraCss = extraCss;
      };
    };

  # GTK4 Theme
  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
}
