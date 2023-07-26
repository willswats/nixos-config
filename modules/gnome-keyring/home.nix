{ config, pkgs, ... }:

{
  services = {
    gnome-keyring.enable = true;
  };

  xsession.profileExtra = ''
    eval $(${pkgs.gnome3.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
    export SSH_AUTH_SOCK
  '';
}
