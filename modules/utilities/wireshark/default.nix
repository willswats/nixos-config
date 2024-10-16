{ globals, pkgs, ... }:

{
  users.users.${globals.user}.extraGroups = [ "wireshark" ];

  programs.wireshark.enable = true;
  environment.systemPackages = with pkgs; [ wireshark ];
}
