{ pkgs
, lib
, config
, ...
}:

let
  gammastep = "${pkgs.gammastep}/bin/gammastep";
  gammastepToggle = pkgs.writeShellScript "gammastepToggle.sh" ''
    if pgrep gammastep; then
      pkill -USR1 ${gammastep}
    else
      ${gammastep}
    fi
  '';
in
{
  services.gammastep = {
    enable = true;
    tray = true;
    dawnTime = "6:00-7:45";
    duskTime = "18:35-20:15";
    temperature = {
      day = 6500;
      night = 3000;
    };
  };


  wayland.windowManager.sway.config =
    let
      mod = config.wayland.windowManager.sway.config.modifier;
    in
    lib.mkIf config.wayland.windowManager.sway.enable {
      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+b" = "exec ${gammastepToggle}";
      };
    };

  wayland.windowManager.hyprland.settings.bind =
    lib.mkIf config.wayland.windowManager.hyprland.enable
      [
        "$mod shift, b, exec, ${gammastepToggle}"
      ];

  wayland.windowManager.niri.settings.binds =
    lib.mkIf config.wayland.windowManager.niri.enable {
      "Mod+Shift+b".spawn = [ "${gammastepToggle}" ];
    };
}
