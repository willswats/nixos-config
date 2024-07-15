{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    flutter
  ];

  shellHook = ''
    flutter --disable-analytics
  '';
}
