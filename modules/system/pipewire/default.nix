{ ... }:

{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig =
      {
        pipewire."92-low-latency" =
          let
            quant = 2048;
            minQuant = 256;
            maxQuant = 8192;
          in
          {
            context.properties = {
              default.clock.rate = 48000;
              default.clock.quantum = quant;
              default.clock.min-quantum = minQuant;
              default.clock.max-quantum = maxQuant;
            };
          };
        # Applications using the Pulse backend have a separate configuration.
        # The default minimum value  is 1024, so it needs to be tweaked if low-latency audio is desired.
        # As a general rule, the values in pipewire-pulse should not be lower than the ones in pipewire.
        pipewire-pulse."92-low-latency" =
          let
            quant = "2048";
            minQuant = "256";
            maxQuant = "8192";
          in
          {
            "context.properties" = [
              {
                name = "libpipewire-module-protocol-pulse";
                args = { };
              }
            ];
            "pulse.properties" = {
              "pulse.min.req" = "${minQuant}/48000";
              "pulse.default.req" = "${quant}/48000";
              "pulse.max.req" = "${maxQuant}/48000";
              "pulse.min.quantum" = "${minQuant}/48000";
              "pulse.max.quantum" = "${maxQuant}/48000";
            };
            "stream.properties" = {
              "node.latency" = "${quant}/48000";
              "resample.quality" = 1;
            };
          };
      };
  };
}
