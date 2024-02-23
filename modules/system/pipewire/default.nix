{ inputs, ... }:

{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    lowLatency.enable = true; # provided by nix-gaming 
  };
}
