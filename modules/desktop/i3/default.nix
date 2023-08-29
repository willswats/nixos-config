{ ... }:

{
  imports = [
    ../all/sddm
    ./redshift
    ./blueman
  ];

  services.xserver = {
    windowManager.i3.enable = true;
    displayManager = {
      defaultSession = "none+i3";
    };
  };
}
