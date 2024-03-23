{ pkgs, ... }:


{
  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [
        "-w 1920"
        "-h 1080"
        "-W 1920"
        "-H 1080"
        "-f" # Fullscreen by default
        "-e" # Enable steam integration (fix mouse issues on certain games)
      ];
    };
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Fix gamescope on steam https://github.com/ValveSoftware/gamescope/issues/905#issuecomment-1660112668
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        keyutils
        libkrb5
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
      ];
    };
  };

  # TF2 is currently broken on Linux and this is needed to fix it.
  # Issue: https://github.com/ValveSoftware/Source-1-Games/issues/5043
  # Fix: https://github.com/NixOS/nixpkgs/issues/271483#issuecomment-1838055011
  environment.systemPackages = with pkgs; [
    pkgsi686Linux.gperftools
  ];
}
