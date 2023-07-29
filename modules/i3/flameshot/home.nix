{ pkgs, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      showStartupLaunchMessage = false;
    };
  };
}
