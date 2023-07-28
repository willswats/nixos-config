{ pkgs, ... }:

{
  gtk.gtk2.extraConfig = "gtk-error-bell = 0";

  gtk.gtk3.extraConfig = {
    gtk-error-bell = 0;
  };

  gtk.gtk4.extraConfig = {
    gtk-error-bell = 0;
  };
}
