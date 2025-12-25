{ pkgs, ... }:

{
  programs.steam.platformOptimizations.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      steamtinkerlaunch
      # Not using this, because when proton-ge-bin updates, all games set with it are reset to no proton
      # proton-ge-bin
    ];
  };

  # Fix gamescope on steam https://wiki.nixos.org/wiki/Steam#Gamescope_fails_to_launch_when_used_within_Steam
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          # gamescope
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib # Provides libstdc++.so.6
          libkrb5
          keyutils
          # beamp
          nss # Provides libnss3.so for native beamng
        ];
    };
  };

  # Certain source games are currently broken on Linux and this is needed to fix it.
  # Issue: https://github.com/ValveSoftware/Source-1-Games/issues/5043
  # Fix: https://github.com/NixOS/nixpkgs/issues/271483#issuecomment-1838055011
  environment.systemPackages = with pkgs; [
    pkgsi686Linux.gperftools
  ];
}
