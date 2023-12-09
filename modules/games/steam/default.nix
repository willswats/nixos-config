{ pkgs, ... }:

{
  # TF2 is currently broken on Linux and this is needed to fix it.
  # Issue: https://github.com/ValveSoftware/Source-1-Games/issues/5043
  # Fix: https://github.com/NixOS/nixpkgs/issues/271483#issuecomment-1838055011
  environment.systemPackages = with pkgs; [
    pkgsi686Linux.gperftools
  ];
}
