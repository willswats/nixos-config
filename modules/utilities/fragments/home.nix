{ pkgs, ... }:

{
  home.packages = with pkgs; [ fragments ];

  # Connect to mullvad before starting
  # https://gitlab.gnome.org/World/Fragments/-/blob/main/data/de.haeckerfelix.Fragments.desktop.in.in?ref_type=heads
  home.file.".local/share/applications/de.haeckerfelix.Fragments.desktop".text =
    ''
      [Desktop Entry]
      Name=Fragments
      Icon=de.haeckerfelix.Fragments
      Exec=bash -c "mullvad connect; fragments"
      Terminal=false
      Type=Application
      StartupNotify=true
      DBusActivatable=true
      MimeType=x-scheme-handler/magnet;application/x-bittorrent;
      Categories=GNOME;GTK;Utility;FileTransfer;P2P;
      Keywords=bittorrent;torrent;magnet;download;p2p;
      X-Purism-FormFactor=Workstation;Mobile;
    '';
}
