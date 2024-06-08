{ pkgs, ... }:

{
  home.packages = with pkgs; [
    imv
  ];

  xdg.mimeApps = {
    defaultApplications = {
      "image/png" = [ "imv-dir.desktop" ]; # jpg
      "image/jpeg" = [ "imv-dir.desktop" ]; # png
      "image/webp" = [ "imv-dir.desktop" ]; # webp
      "image/svg" = [ "imv-dir.desktop" ]; # svg
      "image/gif" = [ "imv-dir.desktop" ]; # gif
    };
  };

  xdg.configFile."imv/config" = {
    text = ''
      [binds]
      n = next
      p = prev
    '';
  };
}
