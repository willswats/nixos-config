{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/yuzu { })
  ];

  home.file.".local/share/icons/yuzu.png".source = ./yuzu.png;
  home.file.".local/share/applications/yuzu.desktop".text =
    let
      version = "4176";
    in
    ''
      [Desktop Entry]
      Name=Yuzu
      Exec=Yuzu-${version}
      Type=Application
      Icon=yuzu
    '';
}
