{ ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        zathura = "org.pwmt.zathura.desktop";
      in
      {
        "application/epub+zip" = [ zathura ]; # epub
      };
  };

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}