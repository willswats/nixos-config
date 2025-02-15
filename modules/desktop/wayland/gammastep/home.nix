{ pkgs, lib, config, ... }:

let
  gammastep = "${pkgs.gammastep}/bin/gammastep";
  gammastepToggle = pkgs.writeShellScript "gammastepToggle.sh" ''
    if pgrep gammastep; then
      killall .gammastep-wrap
    else
      ${gammastep}
    fi
  '';
in
{
  services.gammastep = {
    enable = true;
    dawnTime = "08:00";
    duskTime = "19:00";
    temperature = {
      day = 6500;
      night = 2500;
    };
    settings = {
      general = {
        fade = 0;
      };
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
    lib.mkIf config.wayland.windowManager.hyprland.enable [
      "$mod shift, b, exec, ${gammastepToggle}"
    ];
}
