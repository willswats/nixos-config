{ pkgs, globals, ... }:

{
  users.users.${globals.user}.extraGroups = [ "libvirtd" ];

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}
