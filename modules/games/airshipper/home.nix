{ pkgs, ... }:

{
  home.packages = with pkgs; [ airshipper ];

  # Airshipper will not launch without setting `WINIT_UNIX_BACKEND=x11`
  # https://gitlab.com/veloren/airshipper/-/blob/master/client/assets/net.veloren.airshipper.desktop?ref_type=heads
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
