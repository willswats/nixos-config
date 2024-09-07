{ ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.comicbook+zip" = [ "org.pwmt.zathura.desktop" ]; # cbz
    };
  };

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
