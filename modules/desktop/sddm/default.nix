{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "gb";
    excludePackages = [ pkgs.xterm ];
    displayManager.sddm = {
      enable = true;
    };
  };
}
