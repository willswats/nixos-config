{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unityhub
    vscode # Needed to generate the project files needed for OmniSharp to find the root dir in Neovim
  ];
}
