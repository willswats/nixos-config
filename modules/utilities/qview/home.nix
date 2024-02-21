{ pkgs, ... }:

{
  home.packages = with pkgs; [ qview ];

  xdg.mimeApps = {
    defaultApplications = {
      "image/png" = [ "com.interversehq.qView.desktop" ]; # jpg
      "image/jpeg" = [ "com.interversehq.qView.desktop" ]; # png
    };
  };
}
