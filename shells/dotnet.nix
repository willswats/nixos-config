{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    dotnet-sdk
  ];

  env = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    DOTNET_CLI_TELEMETRY_OPTOUT = "true";
  };
}
