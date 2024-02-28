{ pkgs, ... }:

{
  home.packages = with pkgs; [ miru ];

  # Connect to mullvad before starting
  home.file.".local/share/applications/miru.desktop".text =
    ''
      [Desktop Entry]
      Name=Miru
      Exec=bash -c "mullvad connect; miru %U"
      Terminal=false
      Type=Application
      Icon=miru
      StartupWMClass=Miru
      X-AppImage-Version=4.5.10
      Comment=Bittorrent streaming software for cats
      Keywords=anime
      MimeType=x-scheme-handler/miru;
      Categories=AudioVideo;Video;
    '';
}
