{ pkgs, globals, host, ... }:

{
  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf" =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
      wallpaper = globals.wallpaper;
    in
    {
      text = ''
        preload = ${wallpaper}

        wallpaper = ${monitorCenter},${wallpaper}
        wallpaper = ${monitorLeft},${wallpaper}
      '';
    };
}
