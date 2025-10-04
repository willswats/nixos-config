{ pkgs, ... }:

{
  home.packages = with pkgs.nodePackages; [
    nodejs
    pnpm
    live-server
  ];
}
