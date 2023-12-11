{ ... }:

{
  # https://github.com/ebkr/r2modmanPlus/issues/1007
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
