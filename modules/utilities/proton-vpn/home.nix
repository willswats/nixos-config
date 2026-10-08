{ pkgs
, lib
, config
, ...
}:

let
  notify-send = "${pkgs.libnotify}/bin/notify-send";
  protonvpn = "${pkgs.proton-vpn-cli}/bin/protonvpn";
  protonVpnToggle = pkgs.writeShellScript "protonVpnToggle.sh" ''

    if ${protonvpn} status | grep 'Connected'; then
      ${notify-send} "ProtonVPN" "Disconnecting"
      if ${protonvpn} disconnect; then
        ${notify-send} "ProtonVPN"  "Disconnected"
      else
        ${notify-send} "ProtonVPN" "Disconnect failed"
      fi
    else
      ${notify-send} "ProtonVPN" "Connecting"
      if ${protonvpn} connect --country sweden; then
        ${notify-send} "ProtonVPN" "Connected"
      else
        ${notify-send} "ProtonVPN" "Connection failed"
      fi
    fi
  '';
in
{
  home.packages = with pkgs; [ proton-vpn-cli ];

  wayland.windowManager.sway.config =
    let
      mod = config.wayland.windowManager.sway.config.modifier;
    in
    lib.mkIf config.wayland.windowManager.sway.enable {
      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+p" = "exec ${protonVpnToggle}";
      };
    };

  wayland.windowManager.hyprland.settings.bind =
    lib.mkIf config.wayland.windowManager.hyprland.enable
      [
        "$mod shift, p, exec, ${protonVpnToggle}"
      ];

  wayland.windowManager.niri.settings.binds =
    lib.mkIf config.wayland.windowManager.niri.enable {
      "Mod+Shift+p".spawn = [ "${protonVpnToggle}" ];
    };
}
