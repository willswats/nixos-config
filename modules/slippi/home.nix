{ config, pkgs, ... }:

{
  home.packages =
    [
      (
        let
          user = "project-slippi";
          project = "slippi-launcher";
          assetName = "Slippi-Launcher-${version}-x86_64.AppImage";
          version = "2.10.2"; # Pin the version as each new version will return a different hash
          hash = "0yjzzml59v5b7amlllrv8dhcx4kf52cakbc028bb7xisj7lib73x"; # nix-prefetch-url https://github.com/project-slippi/slippi-launcher/releases/download/v2.10.2/Slippi-Launcher-2.10.2-x86_64.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "slippi-launcher";
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/v${version}/${assetName}";
              sha256 = "${hash}";
            };
          }
      )
      (
        let
          user = "project-slippi";
          project = "Ishiiruka";
          assetName = "Slippi_Online-x86_64.AppImage";
          version = "3.1.0"; # Pin the version as each new version will return a different hash
          hash = "039qm941xbl97zvvv0q6480fps4w1a0n71sk1wiacs6n4gm2bs6f"; # nix-prefetch-url nix-prefetch-url https://github.com/project-slippi/Ishiiruka/releases/download/v3.1.0/Slippi_Online-x86_64.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "slippi-online";
            extraPkgs = pkgs: [
              pkgs.gmp
              pkgs.mpg123
              pkgs.libmpg123
            ];
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/v${version}/${assetName}";
              sha256 = "${hash}";
            };
          }
      )
    ];
}
