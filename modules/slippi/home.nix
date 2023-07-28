{ config, pkgs, ... }:

{
  home.packages =
    let
      app_name = "Slippi_Online-x86_64.AppImage";
      gh_proj = "Ishiiruka";
      gh_user = "project-slippi";
      version = "3.1.0";
      hash = "039qm941xbl97zvvv0q6480fps4w1a0n71sk1wiacs6n4gm2bs6f";
    in
    [
      (pkgs.appimageTools.wrapType2
        {
          name = "slippi-online";
          extraPkgs = pkgs: [
            pkgs.gmp
            pkgs.mpg123
            pkgs.libmpg123
          ];
          src = builtins.fetchurl {
            url =
              "https://github.com/${gh_user}/${gh_proj}/releases/download/"
              + "v${version}/${app_name}";
            sha256 = "${hash}";
          };
        })
    ];
}
