{ pkgs, ... }:

{
  # Mullvad is broken on 2023.5
  # https://github.com/mullvad/mullvadvpn-app/issues/5075
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/mullvad-vpn { })
  ];

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
           "changelogDisplayedForVersion": "2023.3"
      }
    '';
  };
}
