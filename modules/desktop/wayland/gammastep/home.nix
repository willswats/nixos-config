{ ... }:

{
  services.gammastep = {
    enable = true;
    tray = true;
    dawnTime = "6:00-7:45";
    duskTime = "18:35-20:15";
    settings = {
      general = {
        fade = 0;
      };
    };
  };
}
