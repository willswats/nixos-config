{ ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.comicbook+zip" = [ "org.pwmt.zathura.desktop" ]; # cbz
      "application/epub+zip" = [ "org.pwmt.zathura.desktop" ]; # epub
    };
  };

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
