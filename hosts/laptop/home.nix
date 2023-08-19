{ host, ... }:

{
  imports = [
    ../home.nix
  ];

  wayland.windowManager.hyprland =
    let
      monitorCenter = host.monitors.center;
    in
    {
      settings = {
        monitor = [
          "${monitorCenter}, 1920x1080@60, 0x0, 1"
        ];
      };
    };
}
