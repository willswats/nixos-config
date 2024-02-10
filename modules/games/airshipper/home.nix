{ pkgs, ... }:

{
  home.packages = with pkgs; [ airshipper ];

  # Airshipper will not launch without setting `WINIT_UNIX_BACKEND=x11`
  home.file.".local/share/icons/net.veloren.airshipper.png".source = ./net.veloren.airshipper.png;
  home.file.".local/share/applications/net.veloren.airshipper.desktop".text =
    ''
      [Desktop Entry]
      Type=Application
      Name=Airshipper
      Comment=Official launcher for Veloren - the open-world, open-source multiplayer voxel RPG
      Exec=bash -c "export WINIT_UNIX_BACKEND=x11;airshipper"
      Categories=Game
      Keywords=veloren, airshipper
      Icon=net.veloren.airshipper
      Terminal=false
    '';
}
