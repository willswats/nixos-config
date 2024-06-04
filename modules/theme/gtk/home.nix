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

      catppuccin = {
        enable = true;
        size = "standard";
        tweaks = [ "normal" ];
        icon.enable = true;
      };
    };
}
