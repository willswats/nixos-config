{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        foliate = "com.github.johnfactotum.Foliate.desktop";
      in
      {
        "application/epub+zip" = [ foliate ]; # epub
      };
  };

  home.packages = with pkgs; [ foliate ];
}
