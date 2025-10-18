{ pkgs, ... }:

{
  imports = [
    ./swaylock
    ./grimshot
    ../wayland/greetd
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [ ]; # By default this installs a few extra unwanted packages
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
