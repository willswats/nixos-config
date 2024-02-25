{ pkgs, ... }:

{
  home.packages = with pkgs; [ fragments ];

  # Connect to mullvad before starting
  home.file.".local/share/applications/de.haeckerfelix.Fragments.desktop".text =
    ''
      [Desktop Entry]
      Type=Application
      Name=Fragments
      Exec=bash -c "mullvad connect;fragments"
      Icon=de.haeckerfelix.Fragments
      Terminal=false
    '';
}
