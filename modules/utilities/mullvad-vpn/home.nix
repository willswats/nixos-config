{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mullvad-vpn
  ];

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
}
