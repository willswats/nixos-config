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
    # For low latency - keep increasing the quant value until you get no crackles
    extraConfig = {
      pipewire."92-low-latency" = {
        context.properties = {
          default.clock.rate = 48000;
          default.clock.quantum = 800;
          default.clock.min-quantum = 512;
          default.clock.max-quantum = 1024;
        };
      };
      # Applications using the Pulse backend have a separate configuration.
      # The default minimum value  is 1024, so it needs to be tweaked if low-latency audio is desired.
      # As a general rule, the values in pipewire-pulse should not be lower than the ones in pipewire.
      pipewire-pulse."92-low-latency" = {
        "context.properties" = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = { };
          }
        ];
        "pulse.properties" = {
          "pulse.min.req" = "256/48000";
          "pulse.default.req" = "256/48000";
          "pulse.max.req" = "256/48000";
          "pulse.min.quantum" = "256/48000";
          "pulse.max.quantum" = "256/48000";
        };
        "stream.properties" = {
          "node.latency" = "256/48000";
          "resample.quality" = 1;
        };
      };
    };
  };
}
