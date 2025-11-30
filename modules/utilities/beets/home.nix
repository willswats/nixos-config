{ host, ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      plugins = "musicbrainz missing embedart fetchart";
      directory = "${host.directories.drive}/Entertainment/Music/Albums";
    };
  };
}
