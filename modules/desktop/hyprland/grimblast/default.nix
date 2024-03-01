{ globals, ... }:

{
  environment.variables = {
    XDG_SCREENSHOTS_DIR = "${globals.homeDir}/Pictures";
  };
}
