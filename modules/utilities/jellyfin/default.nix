{ globals, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = globals.user;
  };

  # This is needed so that jellyfin can see the rclone mounted drive
  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}
