{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.comicbook+zip" = [ "yacreader.desktop" ]; # cbz
    };
  };

  home.packages = with pkgs; [ yacreader ];
}
