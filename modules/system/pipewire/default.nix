{ inputs, ... }:

{
  # Currently broken https://github.com/fufexan/nix-gaming/issues/161
  # imports = [
  #   inputs.nix-gaming.nixosModules.pipewireLowLatency
  # ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    # provided by nix-gaming
    # lowLatency = {
    #   enable = true;
    #   quantum = 64;
    #   rate = 48000;
    # };
  };
}
