{ pkgs, ... }:

{

  xdg.mimeApps = {
    defaultApplications =
      let
        gimp = "gimp.desktop";
      in
      {
        "image/x-xcf" = [ gimp ]; # gimp
      };
  };

  home.packages = with pkgs; [ gimp3 ];
}
