{ ... }:

{
  xdg.configFile."Mullvad VPN/gui_settings.json" = {
    text = ''
      {
           "preferredLocale": "system",
           "autoConnect": true,
           "enableSystemNotifications": true,
           "monochromaticIcon": true,
           "startMinimized": true,
           "unpinnedWindow": true,
           "browsedForSplitTunnelingApplications": [],
           "changelogDisplayedForVersion": "2024.3"
      }
    '';
  };
}
