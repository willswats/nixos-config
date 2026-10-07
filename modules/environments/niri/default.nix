{ pkgs, ... }:

{
  imports = [
    ../sway/swaylock
    ../sway/grimshot
    ../wayland/greetd
  ];

  programs.niri = {
    enable = true;
  };

  xdg.portal.wlr = {
    enable = true;
    settings = {
      screencast = {
        chooser_type = "dmenu";
        chooser_cmd = "${pkgs.rofi}/bin/rofi -dmenu -p 'Select a source to share'";
      };
    };
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
