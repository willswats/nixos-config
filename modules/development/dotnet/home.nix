{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mono
    dotnet-sdk
    omnisharp-roslyn
  ];
}
