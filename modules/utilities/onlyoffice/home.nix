{ pkgs, ... }:

{
  xdg.mimeApps = {
    defaultApplications =
      let
        onlyoffice = "onlyoffice-desktopeditors.desktop";
      in
      {
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
          onlyoffice
        ]; # docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
          onlyoffice
        ]; # pptx
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [
          onlyoffice
        ]; # xlsx
      };
  };

  home.packages = with pkgs; [
    onlyoffice-desktopeditors
  ];
}
