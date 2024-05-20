{ pkgs, globals, ... }:

let
  yuzuLocation = "${globals.directories.drive}/Games/Emulation/Emulators/Yuzu/Linux-Yuzu-EA-4176.AppImage";
  yuzuExec = "${pkgs.appimage-run}/bin/appimage-run ${yuzuLocation}";
in
{
  home.file.".local/share/icons/yuzu.png".source = ./yuzu.png;
  home.file.".local/share/applications/yuzu.desktop".text = ''
    [Desktop Entry]
    Name=Yuzu
    Exec=${yuzuExec}
    Type=Application
    Icon=yuzu
  '';
}
