{ pkgs
, lib
, config
, ...
}:

let
  wlsunset = "${pkgs.wlsunset}/bin/wlsunset";
  wlsunsetToggle = pkgs.writeShellScript "wlsunsetToggle.sh" ''
    if pgrep wlsunset; then
      killall wlsunset
    else
      ${wlsunset}
    fi
  '';
in
{
  services.wlsunset = {
    enable = true;
    sunrise = "08:00";
    sunset = "19:00";
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
        "${mod}+Shift+b" = "exec ${wlsunsetToggle}";
      };
    };

  wayland.windowManager.hyprland.settings.bind =
    lib.mkIf config.wayland.windowManager.hyprland.enable
      [
        "$mod shift, b, exec, ${wlsunsetToggle}"
      ];
}
