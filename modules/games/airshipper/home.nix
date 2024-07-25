{ pkgs, ... }:

{
  # Set WINIT_UNIX_BACKEND to x11 to run on Wayland
  # https://gitlab.com/veloren/airshipper/-/blob/master/client/assets/net.veloren.airshipper.desktop
  home.file.".local/share/applications/net.veloren.airshipper.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Airshipper
    Comment=Official launcher for Veloren - the open-world, open-source multiplayer voxel RPG
    Exec=sh -c 'export WINIT_UNIX_BACKEND=x11;airshipper'
    Categories=Game
    Keywords=veloren, airshipper
    Icon=net.veloren.airshipper
    Terminal=false
  '';

  home.packages = with pkgs; [ airshipper ];
}
