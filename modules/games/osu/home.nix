{ pkgs, ... }:

{
  home.packages =
    [
      (
        let
          user = "ppy";
          project = "osu";
          assetName = "osu.AppImage";
          version = "2023.803.0"; # Pin the version as each new version will return a different hash
          hash = "01gjrjakd08kg5g08pkn451q6yw8dgsh0kapb41i31q42bp67vvw"; # nix-prefetch-url https://github.com/ppy/osu/releases/download/2023.803.0/osu.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "osu!";
            extraPkgs = pkgs: with pkgs; [ icu ];
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/${version}/${assetName}";
              sha256 = "${hash}";
            };
          }
      )
    ];

  # Create desktop entry
  home.file.".local/share/icons/lazer.png".source = ./lazer.png;
  home.file.".local/share/applications/osu.desktop".text = ''
    [Desktop Entry]
    Name=osu!
    Exec=osu!
    Type=Application
    Icon=lazer
  '';
}
