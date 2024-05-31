{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "onlyoffice.desktop" ]; # docx
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "onlyoffice.desktop" ]; # pptx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "onlyoffice.desktop" ]; # xlsx
    };
  };

  home.packages = with pkgs; [
    onlyoffice-bin_latest
  ];
}
