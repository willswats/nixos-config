{ pkgs
, lib
, config
, ...
}:

let
  protonvpn = "${pkgs.proton-vpn-cli}/bin/protonvpn";
  protonVpnToggle = pkgs.writeShellScript "protonVpnToggle.sh" ''
    if ${protonvpn} status | grep 'Connected'; then
    	 ${protonvpn} disconnect
    else
    	${protonvpn} connect --country sweden
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
}
