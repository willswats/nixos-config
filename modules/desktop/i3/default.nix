{ pkgs, ... }:

{
  imports = [
    ../redshift
    ../blueman
  ];

  services = {
    xserver = {
      desktopManager = { xterm.enable = false; };
      excludePackages = [ pkgs.xterm ];

      displayManager.defaultSession = "none+i3";
      windowManager.i3.enable = true;
    };
  };
}
