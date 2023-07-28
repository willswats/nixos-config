{ config, pkgs, ... }:

{
  home.packages =
    let
      user = "project-slippi";
      project = "Ishiiruka";
      assetName = "Slippi_Online-x86_64.AppImage";
      version = "3.1.0"; # Each new version will return a different hash
      hash = "039qm941xbl97zvvv0q6480fps4w1a0n71sk1wiacs6n4gm2bs6f"; # nix-prefetch-url
    in
    [
      (pkgs.appimageTools.wrapType2
        {
          name = "slippi";
          extraPkgs = pkgs: [
            pkgs.gmp
            pkgs.mpg123
            pkgs.libmpg123
          ];
          src = builtins.fetchurl {
            url = "https://github.com/${user}/${project}/releases/download/v${version}/${assetName}";
            sha256 = "${hash}";
          };
        })
    ];
}
