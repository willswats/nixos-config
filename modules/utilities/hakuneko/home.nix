{ pkgs, ... }:

{
  home.file.".local/share/applications/hakuneko-desktop.desktop".text = ''
    [Desktop Entry]
    Name=HakuNeko Desktop
    Exec=hakuneko --no-sandbox
    Type=Application
    Icon=hakuneko-desktop
  '';

  home.packages = with pkgs; [ hakuneko ];
}
