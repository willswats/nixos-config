{ host, ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      plugins = "missing embedart fetchart";
      directory = "${host.directories.drive}/Entertainment/Music/Albums";
    };
  };
}
