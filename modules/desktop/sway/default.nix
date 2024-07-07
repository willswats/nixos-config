{ ... }:

{
  imports = [
    ./swaylock
    ./grimshot
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [ ]; # By default this installs a few extra unwanted packages
  };
}
