{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "onlyoffice-desktopeditors.desktop" ]; # docx
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "onlyoffice-desktopeditors.desktop" ]; # pptx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "onlyoffice-desktopeditors.desktop" ]; # xlsx
    };
  };

  home.packages = with pkgs; [
    onlyoffice-bin_latest
  ];
}
