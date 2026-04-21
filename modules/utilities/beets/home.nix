{ host, pkgs, ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      plugins = "mpdupdate musicbrainz missing embedart fetchart replaygain";
      directory = "${host.directories.drive}/Entertainment/Music/Albums";
      replaygain = {
        backend = "command";
        command = "${pkgs.mp3gain}/bin/mp3gain";
      };
    };
  };
}
