{ pkgs, host, ... }:

{
  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf" =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
      wallpaper = "~/Code/nixos-config/wallpapers/minimal-desert.png";
    in
    {
      text = ''
        preload = ${wallpaper}

        wallpaper = ${monitorCenter},${wallpaper}
        wallpaper = ${monitorLeft},${wallpaper}
      '';
    };
}
