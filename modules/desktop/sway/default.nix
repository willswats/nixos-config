{ pkgs, ... }:

{
  imports = [
    ./swaylock
    ./grimshot
  ];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraPackages = [ ]; # By default this installs a few extra unwanted packages
  };
}
