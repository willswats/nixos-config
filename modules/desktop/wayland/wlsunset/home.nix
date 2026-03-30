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
      ${wlsunset} -S 08:00 -s 18:00 -t 3000 -T 6500
    fi
  '';
in
{
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
