{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    nodePackages.nodejs
    nodePackages.pnpm
    nodePackages.live-server
  ];
}
