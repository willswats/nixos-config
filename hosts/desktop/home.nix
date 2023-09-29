{ pkgs, host, ... }:

{
  imports = [
    ../home.nix
    ../../modules/desktop/hyprland/home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/lutris/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/doom/home.nix
    ../../modules/games/theforceengine/home.nix
    ../../modules/games/ishiiruka/home.nix
    ../../modules/games/retroarch/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    mangohud
    # Games
    steam
    airshipper
    yuzu-mainline
    pcsx2
    rpcs3
  ];

  wayland.windowManager.hyprland =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    {
      enableNvidiaPatches = true;
      settings = {
        # https://wiki.hyprland.org/Nvidia/#how-to-get-hyprland-to-possibly-work-on-nvidia
        env = [
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm"
          "GLX_VENDOR_LIBRARY_NAME,nvidia"
          "WLR_NO_HARDWARE_CURSORS,1"
        ];

        monitor = [
          "${monitorCenter}, 1920x1080@144, 1080x0, 1"
          "${monitorLeft}, 1920x1080@144, 0x0, 1, transform, 3"
        ];
      };
    };
}
