{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        kdenlive = "org.kde.kdenlive.desktop";
      in
      {
        "application/x-kdenlive" = [ kdenlive ]; # kdenlive
      };
  };

  home.packages = with pkgs; [ kdePackages.kdenlive ];
}
