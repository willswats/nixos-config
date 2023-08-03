{ pkgs, ... }:

{
  home.packages = with pkgs; [ mullvad-vpn ];

  xdg.configFile."Mullvad VPN/gui_settings.json" = {
    text = '' {
      "preferredLocale": "system",
      "autoConnect": true,
      "enableSystemNotifications": true,
      "monochromaticIcon": true,
      "startMinimized": true,
      "unpinnedWindow": true,
      "browsedForSplitTunnelingApplications": [],
      "changelogDisplayedForVersion": "2023.4"
    }
  '';
  };
}
