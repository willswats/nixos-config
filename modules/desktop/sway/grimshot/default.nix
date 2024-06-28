{ globals, ... }:

{
  environment.variables = {
    XDG_SCREENSHOTS_DIR = "${globals.directories.home}/Pictures";
  };
}
