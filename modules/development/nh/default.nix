{ globals, ... }:

{
  programs.nh = {
    enable = true;
    flake = globals.directories.flake;
  };
}
