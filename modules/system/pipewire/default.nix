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
    # TODO: uncomment when fixed https://github.com/fufexan/nix-gaming/issues/319
    # lowLatency = {
    #   # enable this module
    #   enable = true;
    #   # defaults (no need to be set unless modified)
    #   quantum = 1024;
    #   rate = 48000;
    # };
  };
}
