{ pkgs, ... }:

{
  imports = [
    ./cs2/home.nix
    ./tf2/home.nix
    ./garrys-mod/home.nix
    ./half-life/home.nix
  ];

  home.packages = with pkgs; [
    steam
  ];
}
