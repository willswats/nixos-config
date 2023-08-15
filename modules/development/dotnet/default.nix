{ pkgs, ... }:

{
  environment.variables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_7}";
    DOTNET_CLI_TELEMETRY_OPTOUT = "true";
  };
}
