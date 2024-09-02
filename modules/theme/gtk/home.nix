{ pkgs, globals, host, ... }:

{
  gtk =
    let
      # Disable error sound
      extraConfig = { gtk-error-bell = 0; };
      # Set border radius to a specific value, this can render as black on some compositors, set it to 0 if needed
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
          bookmarkStartHome = "file://${globals.directories.home}/";
          bookmarkStartDrive = "file://${host.directories.drive}/";

        in
        [
          "${bookmarkStartDrive} Drive"
          "${bookmarkStartHome}/Work/Education/University University"
          "${bookmarkStartHome}Downloads Downloads"
          "${bookmarkStartHome}Pictures Pictures"
          "${bookmarkStartHome}Videos Videos"
          "${bookmarkStartHome}Code Code"
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
        name = "Colloid-Dark-Catppuccin";
        package = pkgs.colloid-gtk-theme.override {
          colorVariants = [ "dark" ]; # Only download dark variant
          tweaks = [
            "catppuccin" # Catppuccin colors
            "black" # Darker catppuccin
            "normal" # Use normal window button style instead of mac style
            "rimless" # Removes the 1px border - fixes Sway borders on GTK windows
          ];
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
  home.sessionVariables.GTK_THEME = "Colloid-Dark-Catppuccin";
}
