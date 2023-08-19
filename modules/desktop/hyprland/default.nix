{ pkgs, ... }:

{
  imports = [
    # ../gammastep
    # ../blueman
    ../swaylock
    ../grim
  ];

  services.xserver = {
    enable = true;
    layout = "gb";
    excludePackages = [ pkgs.xterm ];
    displayManager.sddm = {
      enable = true;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
