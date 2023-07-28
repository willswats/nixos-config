{ pkgs, ... }:

{
  qt = {
    enable = true;
    # Does not support QT6
    platformTheme = "gtk";
    style = {
      name = "gtk2";
    };
  };

  # qt = {
  #   enable = true;
  #   # Supports QT6 
  #   platformTheme = "gnome";
  #   style = {
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt6;
  #   };
  # };
}
