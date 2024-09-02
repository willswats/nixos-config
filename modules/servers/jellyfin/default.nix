{ globals, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = globals.user;
  };
}
