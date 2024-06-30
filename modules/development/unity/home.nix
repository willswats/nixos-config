{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unityhub
    ffmpeg # Required for converting mp3 to wav by Unity
    mono
  ];
}
