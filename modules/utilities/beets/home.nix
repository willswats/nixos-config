{ host, ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      plugins = "mpdupdate missing embedart fetchart";
      directory = "${host.directories.drive}/Entertainment/Music/Albums";
    };
  };
}
