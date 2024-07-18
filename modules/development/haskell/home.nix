{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    stack
    cabal-install
  ];
}
