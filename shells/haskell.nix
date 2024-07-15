{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    ghc
    stack
    cabal-install
  ];
}
