{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        foliate = "com.github.johnfactotum.Foliate.desktop";
      in
      {
        "application/epub+zip" = [ foliate ]; # epub
        "application/vnd.comicbook+zip" = [ foliate ]; # cbz
      };
  };

  home.packages = with pkgs; [ foliate ];
}
