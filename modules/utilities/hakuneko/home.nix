{ pkgs, ... }:

{
  # HakuNeko isn't maintained anymore. HaruNeko is, but it doesn't have
  # a flatpak or appimage, just snap.
  # - https://github.com/manga-download/haruneko
  # - https://github.com/manga-download/haruneko/issues/1369
  home.file.".local/share/applications/hakuneko-desktop.desktop".text = ''
    [Desktop Entry]
    Name=HakuNeko Desktop
    Exec=hakuneko --no-sandbox
    Type=Application
    Icon=hakuneko-desktop
  '';

  home.packages = with pkgs; [ hakuneko ];
}
