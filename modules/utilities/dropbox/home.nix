{ pkgs, host, ... }:

let
  driveDir = host.directories.drive;
in
{
  home.packages = with pkgs; [ dropbox ];

  services.dropbox = {
    enable = true;
    path = driveDir;
  };
}
