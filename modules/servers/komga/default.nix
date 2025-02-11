{ globals, ... }:

{
  services.komga = {
    enable = true;
    openFirewall = true;
    user = globals.user;
    settings = { server.port = 8080; };
  };
}
