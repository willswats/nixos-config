{ pkgs, ... }:

{
  imports = [ ../vscode/home.nix ];

  home.packages = with pkgs; [
    unityhub
    mono
  ];
}
