{ ... }:

{
  services.gammastep = {
    enable = true;
    dawnTime = "08:00";
    duskTime = "19:00";
    temperature = {
      day = 6500;
      night = 2500;
    };
    settings = {
      general = {
        fade = 0;
      };
    };
  };
}
