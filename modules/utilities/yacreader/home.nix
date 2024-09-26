{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.comicbook+zip" = [ "yacreader.desktop" ]; # cbz
      "application/epub+zip" = [ "yacreader.desktop" ]; # epub
    };
  };

  home.packages = with pkgs; [ yacreader ];
}
