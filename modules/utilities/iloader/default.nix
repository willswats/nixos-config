{ inputs, pkgs, ... }:

{
  # services.usbmuxd.enable = true;

  environment.systemPackages = [
    # inputs.iloader.packages.${pkgs.stdenv.hostPlatform.system}.default
    # pkgs.libimobiledevice
    # pkgs.ifuse
  ];
}
