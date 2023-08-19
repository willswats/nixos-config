{ globals, ... }:

{
  environment.variables = {
    GRIM_DEFAULT_DIR = "${globals.homeDir}/Downloads";
  };
}
