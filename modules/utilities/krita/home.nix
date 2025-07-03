{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        krita = "org.kde.krita.desktop";
      in
      {
        "application/x-krita" = [ krita ]; # krita
      };
  };

  home.packages = with pkgs; [ krita ];
}
