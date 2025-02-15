{ pkgs, lib, config, ... }:

let
  mullvad = "${pkgs.mullvad-vpn}/bin/mullvad";
  mullvadToggle = pkgs.writeShellScript "mullvadToggle.sh" ''
    if ${mullvad} status | grep 'Connected'; then
    	 ${mullvad} disconnect
    else
    	${mullvad} connect
    fi
  '';
in
{
  xdg.configFile."Mullvad VPN/gui_settings.json" = {
    text = ''
      {
           "preferredLocale": "system",
           "autoConnect": false,
           "enableSystemNotifications": true,
           "monochromaticIcon": true,
           "startMinimized": true,
           "unpinnedWindow": true,
           "browsedForSplitTunnelingApplications": [],
           "changelogDisplayedForVersion": "2024.3"
      }
    '';
  };

  wayland.windowManager.sway.config.keybindings =
    let
      mod = config.wayland.windowManager.sway.config.modifier;
    in
    lib.mkIf config.wayland.windowManager.sway.enable {
      "${mod}+Shift+v" = "exec ${mullvadToggle}";
    };

  wayland.windowManager.hyprland.settings.bind =
    lib.mkIf config.wayland.windowManager.hyprland.enable [
      "$mod shift, v, exec, ${mullvadToggle}"
    ];

}
