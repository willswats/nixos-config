{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien
  ];
  # Optional, needed for `nix-alien-ld`
  programs.nix-ld.enable = true;
}
