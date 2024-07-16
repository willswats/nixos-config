{ pkgs, ... }:

{
  home.packages = [
    (pkgs.unityhub.override {
      # Found out how to do this from https://huantian.dev/blog/unity3d-rider-nixos/
      extraPkgs = fhsPkgs: [
        # Required for building
        fhsPkgs.python3
        fhsPkgs.ffmpeg
      ];
    })
  ];
}
