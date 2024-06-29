{ ... }:

{
  imports = [
    ./swaylock
    ./grimshot
  ];

  programs.sway = {
    enable = true;
    extraPackages = [ ]; # By default this installs a few extra unwanted packages
  };
}
