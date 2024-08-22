{ globals, ... }:

{
  services.komga = {
    enable = true;
    openFirewall = true;
    user = globals.user;
  };
}
