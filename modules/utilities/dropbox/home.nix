{ globals, pkgs, ... }:

let
  # This script creates the url used to open a file in dropbox and subsequently opens it in firefox
  # It cuts /home/user/Dropbox from pwd and it replaces any spaces with + in the filename
  firefox = "${pkgs.firefox}/bin/firefox";
  openInDropbox = pkgs.writeShellScript "openInDropbox.sh" ''
    ${firefox} "https://www.dropbox.com/home/$(pwd | sed 's#${globals.directories.drive}/##')?preview=$(basename "$1" | tr ' ' '+')"
  '';

in
{
  xdg.mimeApps = {
    defaultApplications = {
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "open-in-dropbox.desktop" ]; # docx
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "open-in-dropbox.desktop" ]; # pptx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "open-in-dropbox.desktop" ]; # xlsx
    };
  };

  home.file.".local/share/applications/open-in-dropbox.desktop".text = ''
    [Desktop Entry]
    Name=Open In Dropbox
    Exec=${openInDropbox.outPath} %u
    Type=Application
    Icon=dropbox
  '';

  programs.fish.shellAliases = {
    opend = openInDropbox.outPath;
  };

  home.packages = with pkgs; [ dropbox ];
}
