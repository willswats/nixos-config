{ config, pkgs, ... }:

{
  users.users.will.extraGroups = [ "libvirtd" ];

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}
