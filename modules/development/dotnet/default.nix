{ pkgs, ... }:

{
  environment.variables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    DOTNET_CLI_TELEMETRY_OPTOUT = "true";
  };
}
