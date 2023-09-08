{ pkgs, ... }:

{
  home.packages = with pkgs.libsForQt5; [
    (callPackage ../../../pkgs/openmw {
      inherit (darwin.apple_sdk.frameworks) VideoDecodeAcceleration;
    })
    qt5.qtwayland # Fix crash on startup
  ];
}
