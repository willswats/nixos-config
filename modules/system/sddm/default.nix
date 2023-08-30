{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (callPackage ../../../../pkgs/catppuccin-sddm { })
  ];

  services.xserver = {
    enable = true;
    layout = "gb";
    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
      touchpad = { accelProfile = "flat"; };
    };
    excludePackages = [ pkgs.xterm ];
    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
    };
  };
}
