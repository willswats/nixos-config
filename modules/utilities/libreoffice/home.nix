{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        desktopFile = "libreoffice.desktop";
      in
      {
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "${desktopFile}" ]; # docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "${desktopFile}" ]; # pptx
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "${desktopFile}" ]; # xlsx
      };
  };

  home.packages = with pkgs; [
    libreoffice
  ];
}
