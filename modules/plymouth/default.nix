{ config, pkgs, ... }:

{
  boot.initrd.systemd.enable = true;
  boot.plymouth = {
    enable = true;
    theme = "catppuccin-mocha";
    themePackages = [
      (pkgs.catppuccin-plymouth.override { variant = "mocha"; })
    ];
  };
}
