{ pkgs, host, ... }:

{
  gtk =
    let
      # Disable error sound
      extraConfig = { gtk-error-bell = 0; };
    in
    {
      enable = true;
      font = {
        name = "Hack";
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        size = 10;
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
      };
      gtk4 = {
        extraConfig = extraConfig;
      };
    };

  # GTK4 Theme
  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Blue-dark";
}
